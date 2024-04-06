import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/animalItem.dart';

class CupertinoSecondPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CupertinoSecondApp();
  final List<Animal>? list;
  CupertinoSecondPage({Key? key, this.list}) : super(key: key);
}

class _CupertinoSecondApp extends State<CupertinoSecondPage> {
  TextEditingController? _controller;
  int? _kindChoice = 0;
  bool _flyExist = false;
  String? _imagePath;
  Map<int, Widget> segmentWidgets = {
    0: SizedBox(child: Text('양서류', textAlign: TextAlign.center,), width: 80),
    1: SizedBox(child: Text('포유류', textAlign: TextAlign.center,), width: 80),
    2: SizedBox(child: Text('파충류', textAlign: TextAlign.center,), width: 80),
  };

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('동물 추가'),
      ),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: CupertinoTextField(
                  controller: _controller,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                )
              ),
              CupertinoSegmentedControl(
                padding: EdgeInsets.only(bottom: 20, top: 20),
                groupValue: _kindChoice,
                children: segmentWidgets,
                onValueChanged: (int value) {
                setState(() {
                  _kindChoice = value;
                });
              }),
              Row(
                children: <Widget>[
                  Text('날개가 존재합니까?'),
                  CupertinoSwitch(value: _flyExist, onChanged: (value) {
                    setState(() {
                      _flyExist = value;
                    });
                  }),
                  
                ],
                mainAxisAlignment: MainAxisAlignment.center,),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    GestureDetector(
                    child: Image.asset('image/cow.png', width: 80,),
                    onTap: () {
                      _imagePath = 'image/cow.png';
                    },
                  ),
                  GestureDetector(
                    child: Image.asset('image/cat.png', width: 80,),
                    onTap: () {
                      _imagePath = 'image/cat.png';
                    },
                  ),
                  GestureDetector(
                    child: Image.asset('image/dog.png', width: 80,),
                    onTap: () {
                      _imagePath = 'image/dog.png';
                    },
                  ),
                  GestureDetector(
                    child: Image.asset('image/pig.png', width: 80,),
                    onTap: () {
                      _imagePath = 'image/pig.png';
                    },
                  ),
                  GestureDetector(
                    child: Image.asset('image/monkey.png', width: 80,),
                    onTap: () {
                      _imagePath = 'image/monkey.png';
                    },
                  ),
                  GestureDetector(
                    child: Image.asset('image/bee.png', width: 80,),
                    onTap: () {
                      _imagePath = 'image/bee.png';
                    },
                  ),
                  GestureDetector(
                    child: Image.asset('image/wolf.png', width: 80,),
                    onTap: () {
                      _imagePath = 'image/wolf.png';
                    },
                  ),
                  GestureDetector(
                    child: Image.asset('image/fox.png', width: 80,),
                    onTap: () {
                      _imagePath = 'image/fox.png';
                    },
                  ),
                  ],
                ),
              ),
              CupertinoButton(
                child: Text('동물 추가하기'), 
                color: Colors.blue,
              onPressed: () {
                String? _newKind;
                switch (_kindChoice) {
                  case 0: _newKind = "양서류"; break;
                  case 1: _newKind = "포유류"; break;
                  case 2: _newKind = "파충류"; break;
                }

                widget.list?.add(Animal(
                  animalName: _controller?.value.text,
                  kind: _newKind,
                  imagePath: _imagePath,
                  flyExist: _flyExist
                ));
              })
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}