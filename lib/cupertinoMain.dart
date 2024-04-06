import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/iosSub/cupertinoFirstPage.dart';
import 'package:flutter_test_app/iosSub/CupertinoSecondPage.dart';
import 'animalItem.dart';

// 💡TIP: if you get the error - flutter noSuchMethodError constructor declared in class null
// then restart app instead of hot reload
class CupertinoMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CupertinoMain();
  }
}

class _CupertinoMain extends State<CupertinoMain> {
  CupertinoTabBar? tabbar;
  List<Animal> animalList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    tabbar = CupertinoTabBar(items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.add)),
    ]);
    animalList.add(Animal(animalName: "bee", kind: "꿀꿀", imagePath: "image/bee.png"));
    animalList.add(Animal(animalName: "cat", kind: "귀여워", imagePath: "image/cat.png"));
    animalList.add(Animal(animalName: "cow", kind: "음메", imagePath: "image/cow.png"));
    animalList.add(Animal(animalName: "dog", kind: "댕댕2", imagePath: "image/dog.png"));
    animalList.add(Animal(animalName: "fox", kind: "애교애교", imagePath: "image/fox.png"));
    animalList.add(Animal(animalName: "monkey", kind: "꺄르륵", imagePath: "image/monkey.png"));
    animalList.add(Animal(animalName: "pig", kind: "체지방쩔어", imagePath: "image/pig.png"));
    animalList.add(Animal(animalName: "wolf", kind: "아오오오오", imagePath: "image/wolf.png"));
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoTabScaffold(
        tabBar: tabbar!, 
        tabBuilder: (context, value) {
          if (value == 0) {
            return CupertinoFirstPage(list: animalList);
          } else {
            return CupertinoSecondPage(list: animalList);
          }
      }),
    );
  }
}