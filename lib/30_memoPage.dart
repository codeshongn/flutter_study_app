import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/30_memo.dart';
import 'package:flutter_test_app/30_memoAddPage.dart';
import 'package:flutter_test_app/30_memoDetail.dart';

class MemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MemoPage();
}

class _MemoPage extends State<MemoPage> {
  FirebaseDatabase? _database;
  DatabaseReference? reference;
  String _databaseUrl = ''; // TODO delete
  List<Memo> memoList = List.empty(growable: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _database = FirebaseDatabase(databaseURL: _databaseUrl);
    reference = _database!.reference().child('memo');

    reference!.onChildAdded.listen((event) {
      setState(() {
        memoList.add(Memo.fromSnapshot(event.snapshot));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Memo app')),
      body: Container(
        child: Center(
          child: memoList.length == 0 
          ? CircularProgressIndicator()
           : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2), 
              itemBuilder: (context, index) {
                return Card(
                  child: GridTile(
                    child: Container(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: SizedBox(
                        child: GestureDetector(
                          onTap: () async {
                            Memo? memo = await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => MemoDetail(reference!, memoList[index])));

                            if (memo != null) {
                              setState(() {
                                memoList[index].title = memo.title;
                                memoList[index].content = memo.content;
                              });
                            }
                          },
                          onLongPress: () {
                            showDialog(context: context, builder: (context) {
                              return AlertDialog(
                                title: Text(memoList[index].title),
                                content: Text('Do you want to delete'),
                                actions: <Widget>[
                                  TextButton(onPressed: () {
                                    reference!.child(memoList[index].key!)
                                    .remove()
                                    .then((_) {
                                      setState(() {
                                        memoList.removeAt(index);
                                        Navigator.of(context).pop();
                                      });
                                    });
                                  }, child: Text('Yes')),
                                  TextButton(onPressed: () {
                                    Navigator.of(context).pop();
                                  }, child: Text('No'))
                                ],
                              );
                            });
                          },
                          child: Text(memoList[index].content),
                        ),
                      ),
                    ),
                    header: Text(memoList[index].title),
                    footer: Text(memoList[index].createTime.substring(0, 10)),),
                );
              },
              itemCount: memoList.length,
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MemoAddPage(reference!)));
      },
      child: Icon(Icons.add),),
    );
  }
}