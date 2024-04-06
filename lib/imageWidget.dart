import 'package:flutter/material.dart';

class ImageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _imageWidget();
  }
}

class _imageWidget extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Widget')
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Image.asset('image/flutter_logo.png', width: 200, height: 100,),
              Text('Hello Flutter',
                style: TextStyle(fontFamily: 'Pacifico',
                fontSize: 30, color: Colors.blue))
            ],
          )
        )
      )
    );
  }
}