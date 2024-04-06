import 'package:flutter/material.dart';
import 'imageWidget.dart';

// 10 image and font
void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meterial App',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: ImageWidget(),
    );
  }
}

