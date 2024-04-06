
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// 15 http-books
void main() => runApp( MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HttpApp(),
    );
  }
}

class HttpApp extends StatefulWidget {
  @override
  _HttpApp createState() => _HttpApp();
}

class _HttpApp extends State<HttpApp> with SingleTickerProviderStateMixin{
  String result = '';
  List? data;
  TextEditingController? _editingController;
  int page = 1;
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    data = new List.empty(growable: true);
    _editingController = new TextEditingController();
    _scrollController = new ScrollController();

    _scrollController!.addListener(() {
      if (_scrollController!.offset >= 
        _scrollController!.position.maxScrollExtent &&
        !_scrollController!.position.outOfRange) {
          print('bottom');
          page++;
          getJSONData();
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TextField(
        controller: _editingController,
        style: TextStyle(color: Colors.blue),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(hintText: '검색어를 입력하세요'),
      ),),
      body: Container(
        child: Center(
          child: data!.length == 0? 
            Text('데이터가 없습니다', style: TextStyle(fontSize: 20), textAlign: TextAlign.center,) 
          : ListView.builder(itemBuilder: (context, index) {
            return Card(
              child: Container(
                child: Row(
                  children: <Widget>[
                    Image.network(
                      data![index]['thumbnail'],
                      height: 100,),
                    Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width - 150,
                          child: Text(
                            data![index]['title'].toString(),
                            textAlign: TextAlign.center,
                          )
                        ),
                        Text('저자: ${data![index]['authors'].toString()}'),
                        Text('가격: ${data![index]['sale_price'].toString()}'),
                        Text('판매중: ${data![index]['status'].toString()}')
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,),
                  ],
                ),
              ),
            );
          },
          itemCount: data!.length,
          controller: _scrollController,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.file_download),
        onPressed: () async {
          page = 1;
          data!.clear();
          getJSONData();
        }),
    );
  }
  Future<String> getJSONData() async {
    var url = 'https://dapi.kakao.com/v3/search/book?target=title&page=$page&query=${_editingController!.value.text}';
    print('url : ${url}');
    var response = await http.get(Uri.parse(url),
      headers: {"Authorization": "KakaoAK ####"});
      // print(response.body);
    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      List result = dataConvertedToJSON['documents'];
      data!.addAll(result);
    });
    return response.body;
  }
}

// class _HttpApp extends State<HttpApp> with SingleTickerProviderStateMixin{
//   String result = '';
//   List? data;

//   @override
//   void initState() {
//     super.initState();
//     data = new List.empty(growable: true);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Http Example'),),
//       body: Container(
//         child: Center(
//           child: data!.length == 0? 
//             Text('데이터가 없습니다', style: TextStyle(fontSize: 20), textAlign: TextAlign.center,) 
//           : ListView.builder(itemBuilder: (context, index) {
//             return Card(
//               child: Container(
//                 child: Column(
//                   children: <Widget>[
//                     Text(data![index]['title'].toString()),
//                     Text(data![index]['authors'].toString()),
//                     Text(data![index]['sale_price'].toString()),
//                     Text(data![index]['status'].toString()),
//                     Image.network(data![index]['thumbnail'],
//                     height: 100, width: 100, fit: BoxFit.contain,)
//                   ],
//                 ),
//               ),
//             );
//           },
//           itemCount: data!.length,),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.file_download),
//         onPressed: () async {
//           getJSONData();
//         }),
//     );
//   }
//   Future<String> getJSONData() async {
//     var url = 'https://dapi.kakao.com/v3/search/book?target=title&query=doit';
//     var response = await http.get(Uri.parse(url),
//       headers: {"Authorization": "KakaoAK 49e6ba134eaa29383e847acae83013b4"});
//       print(response.body);
//     setState(() {
//       var dataConvertedToJSON = json.decode(response.body);
//       List result = dataConvertedToJSON['documents'];
//       data!.addAll(result);
//     });
//     return response.body;
//   }
// }
