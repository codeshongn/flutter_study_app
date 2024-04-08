import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'main.dart';

class IntroPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _introPage();
}

class _introPage extends State<IntroPage> {
  Widget logo = Icon(Icons.info, size: 50);

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              logo,
              ElevatedButton(onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
                  return MyApp();
                }));
              }, child: Text('다음으로 가기'))
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          )
        ),
      )
    );
  }

  void initData() async {
    var dir = await getApplicationDocumentsDirectory();
    var fileExists = await File(dir.path + '/myimage.jpg').exists();
    if (fileExists) {
      setState(() {
        logo = Image.file(File(dir.path + '/myimage.jpg'),
        height: 200,
        width: 200,
        fit: BoxFit.contain);
      });
      
    }

  }
}