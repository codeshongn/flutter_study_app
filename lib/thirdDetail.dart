import 'package:flutter/material.dart';

class ThirdDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context)!.settings.arguments.toString();

    return Scaffold(
      appBar: AppBar(title: Text('Third Detail')),
      body: Container(
        child: Center(
          // child: ElevatedButton(onPressed: () {
          //   Navigator.of(context).pop();
          // }, child: Text('첫번째 페이지로 돌아가기'))
          child: Text(args, style: TextStyle(fontSize: 30),)
        ),
      ),
    );
  }
}