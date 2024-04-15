import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SendDataApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SendDataApp();
}

class _SendDataApp extends State<SendDataApp> {
  static const platform = const MethodChannel('com.flutter.dev/encrypto');
  TextEditingController _controller = TextEditingController();
  String _changeText = 'Nothing';
  String _reChangeText = 'Nothing2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Send Data')),
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  _changeText,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      _decodeText(_changeText);
                    },
                    child: Text('Decoding')),
                SizedBox(
                  height: 20,
                ),
                Text(
                  _reChangeText,
                  style: TextStyle(fontSize: 20),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Text('encrypt'),
          onPressed: () {
            _SendData(_controller.value.text);
          },
        ));
  }

  Future<void> _SendData(String text) async {
    final String result = await platform.invokeMethod("getEncrypto", text);
    print(result);

    setState(() {
      _changeText = result;
    });
  }

  Future<void> _decodeText(String text) async {
    final String result = await platform.invokeMethod("getDecrypto", text);
    print(result);

    setState(() {
      _reChangeText = result;
    });
  }
}
