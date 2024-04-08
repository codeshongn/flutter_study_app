
import 'package:flutter/material.dart';
import 'package:flutter_test_app/22_intro.dart';
import 'package:flutter_test_app/introPage.dart';

// 21 file load
void main() { 
  runApp( MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: LargeFileMain2());
      home: IntroPage());
  }
}
