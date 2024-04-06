
import 'package:flutter/material.dart';
import 'package:flutter_test_app/sub/firstPage.dart';
import 'package:flutter_test_app/sub/secondPage.dart';

// 12 tapbar
void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Widget Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tabbar Example'),),
      body: TabBarView(
        children: <Widget>[FirstApp(), SecondApp()],
        controller: controller,),
      bottomNavigationBar: TabBar(tabs: <Tab>[
        Tab(icon: Icon(Icons.looks_one, color: Colors.blue,)),
        Tab(icon: Icon(Icons.looks_two, color: Colors.blue,))
      ],
      controller: controller,),
    );
  }
}
