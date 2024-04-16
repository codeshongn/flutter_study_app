import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/30_memo.dart';

class MemoAddPage extends StatefulWidget {
  final DatabaseReference reference;
  MemoAddPage(this.reference);

  @override
  State<StatefulWidget> createState() => _MemoAddPage();
}

class _MemoAddPage extends State<MemoAddPage> {
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
      appBar: AppBar(title: Text('Add Memo')),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'title', fillColor: Colors.blueAccent
                ),
              ),
              Expanded(
                child: TextField(
                  controller: contentController,
                  keyboardType: TextInputType.text,
                  maxLines: 100,
                  decoration: InputDecoration(
                    labelText: 'content',
                  ),
                ),
              ),
              MaterialButton(
                child: Text('Save'),
                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),
                onPressed: () {
                  widget.reference.push().set(
                    Memo(
                      titleController!.value.text,
                      contentController!.value.text,
                      DateTime.now().toIso8601String()
                      ).toJson()
                  ).then((_) {
                    Navigator.of(context).pop();
                  }
                  );
                }),
            ],
          ),),
      )
    );
  }
}