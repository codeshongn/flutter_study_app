import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/30_memo.dart';

class MemoDetail extends StatefulWidget {
  final DatabaseReference reference;
  final Memo memo;

  MemoDetail(this.reference, this.memo);

  @override
  State<StatefulWidget> createState() => _MemoDetail();
}

class _MemoDetail extends State<MemoDetail> {
  TextEditingController? titleController;
  TextEditingController? contentController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController();
    contentController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.memo.title)),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'title..', fillColor: Colors.blueAccent
                ),
              ),
              Expanded(
                child: TextField(
                  controller: contentController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 100,
                  decoration: InputDecoration(
                    labelText: 'content..'
                  ),
                )),
              MaterialButton(onPressed: () {
                Memo memo = Memo(titleController!.value.text,
                  contentController!.value.text,
                  widget.memo.createTime);

                widget.reference.child(widget.memo.key!).set(memo.toJson()).then((_) {
                  Navigator.of(context).pop(memo);
                });
              },
              child: Text('edit'),
              shape: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),),
            ],
          ),
        ),
      ),
    );
  }
}