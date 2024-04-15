import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_app/28_sendData.dart';

// 28 Native
void main() { 
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
        home: CupertinoNativeApp(),
      );
    } else {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch:  Colors.blue
        ),
        home: NativeApp(),
        // home: SendDataApp(),
      );
    }
  }
}

class CupertinoNativeApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NativeApp();
  }
}

class NativeApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NativeApp();
}

class _NativeApp extends State<NativeApp> {
  static const platform = const MethodChannel('com.flutter.dev/info');
  static const platform3 = const MethodChannel('com.flutter.dev/dialog');
  String _deviceInfo = 'Unknown info';

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Native app'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(_deviceInfo, style: TextStyle(fontSize: 30),),
              TextButton(onPressed: () {
                _showDialog();
              }, child: Text('Open native'))
            ]
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.get_app),
        onPressed: () {
          _getDeviceInfo();
        },
      ),
    );
  }

  Future<void> _getDeviceInfo() async {
    String deviceInfo;
    try {
      final String result = await platform.invokeMethod('getDeviceInfo');
      deviceInfo = 'Device info : $result';

    } on PlatformException catch (e) {
      deviceInfo = 'Failed to get Device info: ${e.message}';
    }

    setState(() {
      _deviceInfo = deviceInfo;
    });
  }

  Future<void> _showDialog() async {
    try {
      await platform3.invokeMethod('showDialog');
    } on PlatformException catch (e) {
      
    }
  }
}

