
import 'package:flutter/material.dart';
import 'package:flutter_test_app/largeFileMain.dart';

class LargeFileMain2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LargeeFileMain();
}

class _LargeeFileMain extends State<LargeFileMain2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로고 바꾸기'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => LargeFileMain()));
            }, 
            child: Text('로고 바꾸기', style: TextStyle(color: Colors.amber),))
        ],
      ),
      body: Container(),
    );
  }
}