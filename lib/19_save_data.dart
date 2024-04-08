
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 19 save data
void main() => runApp( MyHomePage());

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.light(),
    home: Scaffold(
      appBar: AppBar(title: Text('Flutter Demo Homepage')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _incrementCount();
          });
        },
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text('You have pushed the button this many times'),
              Text('$_counter', style: TextStyle(fontSize: 50),),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    ),
    );
  }

  void _setData(int value) async {
    var key = 'count';
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt(key, value);
  }

  void _loadData() async {
    var key = 'count';
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      var value = pref.getInt(key);
      if (value == null) {
        _counter = 0;
      } else {
        _counter = value;
      }
    });
  }

  void _incrementCount() {
    setState(() {
      _counter++;
      _setData(_counter);
    });
  }
}