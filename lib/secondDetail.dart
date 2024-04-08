import 'package:flutter/material.dart';

class SecondDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Diary2'),),
      body: Container(
        child: Center(
          // child: ElevatedButton(
          //   onPressed: () {
          //   // Navigator.of(context).pop();
          //   Navigator.of(context).pushReplacementNamed('/third');
          // }, 
          // child: Text('세 번째 페이지로 이동합니다')),

          child: Column(
            children: <Widget>[
              TextField(
                controller: controller,
                keyboardType: TextInputType.text,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(controller.value.text);
                }, 
                child: Text('저장하기')
              ),
            ],
          ),
        ),
      ),
    );
  }
}