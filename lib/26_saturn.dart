import 'package:flutter/material.dart';
import 'dart:math';

class SaturnApp extends StatefulWidget {
  _SaturnApp _saturnApp = _SaturnApp();

  @override
  State<StatefulWidget> createState() => _SaturnApp();

  void start() {
    _saturnApp.start();
  }

  void stop() {
    _saturnApp.stop();
  }
}

class _SaturnApp extends State<SaturnApp> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = Tween<double>(begin: 0, end: pi * 2).animate(_animationController!);
    _animationController!.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController!.dispose();
    super.dispose();
  }

  void stop() {
    _animationController!.stop(canceled: true);
  }

  void start() {
    _animationController!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!, 
      builder: (context, child) {
        return SizedBox(
          width: 100,
          height: 100,
          child: Stack(children: <Widget>[
            Image.asset('image/circle.png',
              width: 100,
              height: 100,),
            Center(child: Image.asset('image/sunny.png', width: 30, height: 30,),),
            Padding(padding: EdgeInsets.all(5),
            child: Transform.rotate(angle: _animation!.value,
            origin: Offset(35, 35),
            child: Image.asset('image/saturn.png', width: 20, height: 20,),),)
          ],),
        );
      });
  }
}