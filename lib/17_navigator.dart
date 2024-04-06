
import 'package:flutter/material.dart';
import 'package:flutter_test_app/largeFileMain.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// 17 navigation
void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SubPage Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: FirstPage(),
      initialRoute: '/',
      routes: {'/': (context) => FirstPage(), '/second': (context) => SecondPage()},
      
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subpage main'),
      ),
      body: Container(
        child: Center(
          child: Text('first page'),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage()));
      //   },
      // ),

      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).pushNamed('/second');
      },
      child: Icon(Icons.abc),)
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('돌아가기')), 
            )
        ),
      );
  }
}