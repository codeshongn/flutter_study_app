
import 'package:flutter/material.dart';
import 'package:flutter_test_app/largeFileMain.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// 16 Largefile download and progress bar
void main() => runApp( MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LargeFileMain(),
    );
  }
}
