import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test_app/animalItem.dart';

// class SecondApp extends StatelessWidget {
//   final List<Animal>? list;
//   SecondApp({Key? key, this.list}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Center(
//           child: Text('두번째 페이지')
//         )
//       )
//     );
//   }
// }

class SecondApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SecondApp();
  List<Animal>? list;
  SecondApp({Key? key, this.list}) : super(key: key);
}

class _SecondApp extends State<SecondApp> {
  final nameController = TextEditingController();
  int? _radioValue = 0;
  bool? flyExist = false;
  String? _imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                maxLines: 1,
              ),
              Row(
                children: <Widget>[
                  Radio(value: 0, groupValue: _radioValue, onChanged: (int? value) {setState(() {
                    _radioValue = value;
                  });},),
                  Text('양서류'),
                  Radio(value: 1, groupValue: _radioValue, onChanged: (int? value) {setState(() {
                    _radioValue = value;
                  });},),
                  Text('파충류'),
                  Radio(value: 2, groupValue: _radioValue, onChanged: (int? value) {setState(() {
                    _radioValue = value;
                  });},),
                  Text('포유류'),
                ],
              ),
              Row(
                children: <Widget>[
                  Text('날 수 있나요?'),
                  Checkbox(value: flyExist, onChanged: (bool? check) {
                    setState(() {
                      flyExist = check;
                    });
                  }),
                ],
              ),
              Container(
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
              ElevatedButton(
                child: Text('동물 추가하기'),
                onPressed: () {

                  String? selectedKind;
                  switch(_radioValue) {
                      case 0: 
                        selectedKind = '양서류';
                        break;
                      case 1:
                        selectedKind =  '파충류';
                        break;
                      case 2:
                        selectedKind =  '포유류';
                        break;
                    }
                  var animal = Animal(animalName: nameController.value.text, kind: selectedKind, imagePath: _imagePath, flyExist: flyExist);
                  AlertDialog dialog = AlertDialog(
                    title: Text('동물 추가하기'), 
                    content: Text('이 동물은 ${animal.animalName} 입니다.'
                    '동물의 종류는 ${animal.kind} 입니다. \n날수 있습니까? ${animal.flyExist}\n사진은요? ${animal.imagePath}\n동물을 추가하시겠습니까?',
                    style: TextStyle(fontSize: 30),),
                    actions: [
                      ElevatedButton(onPressed: () {
                        // widget.list?.add(animal);
                        widget.list?.add(animal);
                        Navigator.of(context).pop();
                      }, child: Text('예')),
                      ElevatedButton(onPressed: () {
                        Navigator.of(context).pop();
                      }, child: Text('아니오'))
                    ],
                  );
                  showDialog(context: context, builder: (BuildContext context) => dialog);
                })
            ],
            
          )
        ),
      )
    );
  }
}