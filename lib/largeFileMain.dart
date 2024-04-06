
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class LargeFileMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LargeeFileMain();
}

class _LargeeFileMain extends State<LargeFileMain> {
  final imgUrl = 'http://images.pexels.com/photos/240040/pexels-photo-240040.jpeg'
    '?auto=compress';
  bool downloading = false;
  var progressString = "";
  String file = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Large file download'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          downloadFile();
        },
        child: Icon(Icons.file_download),),
      body: Center(
        child: downloading
        ? Container(
          height: 120,
          width: 200,
          child: Card(
            color: Colors.yellow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(height: 20,),
                Text('Downloading File: $progressString', style: TextStyle(color: Colors.red),)
              ],
            ),
          ),
        )
        : FutureBuilder(
          future: downloadWidget(file), 
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none: return Text('데이터 없음');
              case ConnectionState.waiting: return CircularProgressIndicator();
              case ConnectionState.active: return CircularProgressIndicator();
              case ConnectionState.done: if (snapshot.hasData) {
                return snapshot.data as Widget;
              } 
            }
            print('데이터 없음');
            return Text('데이터 없음');
          },
        )
        
      ),
    );
  }

  Future<void> downloadFile() async {
    Dio dio = Dio();

    try {
      var dir = await getApplicationDocumentsDirectory();
      await dio.download(
        imgUrl,
        '${dir.path}/myimage.jpg',
        onReceiveProgress: (rec, total) {
          print('Rec: $rec, Total: $total');
          file = '${dir.path}/myimage.jpg';
          setState(() {
            downloading = true;
            progressString = ((rec / total) * 100).toStringAsFixed(0) + '%';
          });
        }
      );

    } catch(e) {
      print(e);
    }
    setState(() {
      downloading = false;
      progressString = 'Completed';
    });
    print('Download completed');
  }
}

Future<Widget> downloadWidget(String filePath) async {
  File file = File(filePath);
  bool exist = await file.exists();
  new FileImage(file).evict();

  if (exist) {
    return Center(
      child: Column(
        children: <Widget>[Image.file(File(filePath))],
      ),
    );
  } else {
    return Text('No Data');
  } 

}