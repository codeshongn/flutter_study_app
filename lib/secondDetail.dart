import 'package:flutter/material.dart';

class SecondDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Diary2'),),
      body: Container(
        child: Center(child: ElevatedButton(onPressed: () {
          Navigator.of(context).pop();
        }, child: Text('돌아가기')),),
      ),
    );
  }
}