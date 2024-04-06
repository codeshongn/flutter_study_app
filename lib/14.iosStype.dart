
import 'package:flutter/material.dart';
import 'package:flutter_test_app/cupertinoMain.dart';

// 14 iosStype
void main() => runApp( CupertinoMain());

// class MyApp extends StatelessWidget {
//   static const String _title = 'Widget Example';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
//   TabController? controller;
//   List<Animal> animalList = new List.empty(growable: true);

//   @override
//   void initState() {
//     super.initState();
//     controller = TabController(length: 2, vsync: this);

//     animalList.add(Animal(animalName: "bee", kind: "꿀꿀", imagePath: "image/bee.png"));
//     animalList.add(Animal(animalName: "cat", kind: "귀여워", imagePath: "image/cat.png"));
//     animalList.add(Animal(animalName: "cow", kind: "음메", imagePath: "image/cow.png"));
//     animalList.add(Animal(animalName: "dog", kind: "댕댕2", imagePath: "image/dog.png"));
//     animalList.add(Animal(animalName: "fox", kind: "애교애교", imagePath: "image/fox.png"));
//     animalList.add(Animal(animalName: "monkey", kind: "꺄르륵", imagePath: "image/monkey.png"));
//     animalList.add(Animal(animalName: "pig", kind: "체지방쩔어", imagePath: "image/pig.png"));
//     animalList.add(Animal(animalName: "wolf", kind: "아오오오오", imagePath: "image/wolf.png"));
//   }

//   @override
//   void dispose() {
//     controller!.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Tabbar Example'),),
//       body: TabBarView(
//         children: <Widget>[
//           FirstApp(list: animalList), 
//           SecondApp()],
//         controller: controller,),
//       bottomNavigationBar: TabBar(tabs: <Tab>[
//         Tab(icon: Icon(Icons.looks_one, color: Colors.blue,)),
//         Tab(icon: Icon(Icons.looks_two, color: Colors.blue,))
//       ],
//       controller: controller,),
//     );
//   }
// }
