import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test_app/25_people.dart';
import 'package:flutter_test_app/25_secondPage.dart';

class AnimationApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimationApp();
}

class _AnimationApp extends State<AnimationApp> {
  List<People> peoples = List.empty(growable: true);
  Color weightColor = Colors.blue;
  double _opacity = 1;
  int current = 0;

  @override
  void initState() {
    super.initState();

    peoples.add(People('Nani', 140, 100));
    peoples.add(People('Maru', 195, 60));
    peoples.add(People('Mona', 120, 30));
    peoples.add(People('Rose', 170, 100));
    peoples.add(People('Purple', 180, 80));
    peoples.add(People('Pig', 150, 220));
    peoples.add(People('Queen', 170, 50));
    peoples.add(People('Alen', 190, 100));
    peoples.add(People('Walker', 130, 60));
    peoples.add(People('Avicii', 180, 90));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation')
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              AnimatedOpacity(
                opacity: _opacity, 
                duration: Duration(seconds: 1),
                child: SizedBox(
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 60, child: Text('${current + 1} : ${peoples[current].name}')),
                      AnimatedContainer(
                        duration: Duration(seconds: 2), 
                        curve: Curves.linear,
                        color: Colors.amber,
                        child: Text(
                          '${peoples[current].height}cm',
                          textAlign: TextAlign.center,
                        ),
                        width: 60,
                        height: peoples[current].height,
                      ),
                      AnimatedContainer(
                        duration: Duration(seconds: 2),
                        curve: Curves.easeInCubic,
                        color: weightColor,
                        child: Text(
                          '${peoples[current].weight}kg',
                          textAlign: TextAlign.center,
                        ),
                        width: 60,
                        height: peoples[current].weight,
                      ),
                      AnimatedContainer(
                        duration: Duration(seconds: 2),
                        curve: Curves.linear,
                        color: Colors.pinkAccent,
                        child: Text(
                          '${peoples[current].bmi.toString().substring(0,2)}',
                          textAlign: TextAlign.center,
                        ),
                        width: 60,
                        height: peoples[current].bmi,
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                  height: 200,
                ),
              ),
              ElevatedButton(
                child: Text('Next'),
                onPressed: () {
                  setState(() {
                    if (current < peoples.length - 1) {
                      current++;
                      _changeWeightColor(peoples[current].weight);
                    }
                  });
              }),
              ElevatedButton(
                child: Text('Pre'),
                onPressed: () {
                  setState(() {
                    if (current > 0) {
                      current--;
                      _changeWeightColor(peoples[current].weight);
                    }
                  });
                }
              ),
              ElevatedButton(
              child: Text('Erase'),
                onPressed: () {
                  setState(() {
                    _opacity = 0;
                  });
                }
              ),
              ElevatedButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage()));
              }, 
              child: SizedBox(
                width: 200,
                child: Row(children: <Widget>[
                  Hero(tag: 'detail', child: Icon(Icons.cake)), Text('Move', textAlign: TextAlign.center,),
                ],)
              ))
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            ),
            
          ),
          height: 700,
          ),
    );
  }
  
  void _changeWeightColor(double weight) {
    if (weight < 40) {
      weightColor = Colors.blueAccent;
    } else if (weight < 60) {
      weightColor = Colors.indigo;
    } else if (weight < 80) {
      weightColor = Colors.orange;
    } else {
      weightColor = Colors.red;
    }
  }
}