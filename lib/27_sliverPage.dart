import 'package:flutter/material.dart';
import 'dart:math' as math;

class SliverPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SliverPage();
}

class _SliverPage extends State<SliverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Sliver Example'),
              background: Image.asset('image/sunny.png'),
            ),
            backgroundColor: Colors.deepOrangeAccent,
            pinned: true,
          ),
          SliverPersistentHeader(delegate: _HeaderDelegate(
            minHeight: 50, 
            maxHeight: 150, 
            child: Container(
              color: Colors.blue,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text('list number', style: TextStyle(fontSize: 30),)
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            )),
            pinned: true,),
          SliverList(
            delegate: SliverChildListDelegate([
              CustomCard('1'),
              CustomCard('2'),
              CustomCard('3'),
              CustomCard('4'),
          ])),
          SliverPersistentHeader(delegate: _HeaderDelegate(
            minHeight: 50, 
            maxHeight: 150, 
            child: Container(
              color: Colors.blue,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text('Grid number', style: TextStyle(fontSize: 30),)
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            )),
            pinned: true,),
          SliverGrid(
            delegate: SliverChildListDelegate([
              CustomCard('1'),
              CustomCard('2'),
              CustomCard('3'),
              CustomCard('4'),
            ]), 
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2))
        ],
      ),
    );
  }

  Widget CustomCard(String text) {
    return Card(
      child: Container(
        height: 100,
        child: Center(
          child: Text(text, style: TextStyle(fontSize: 40),),
        ),
      ),
    );
  }
}

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _HeaderDelegate({
    required this.minHeight, 
    required this.maxHeight, 
    required this.child,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(child: child);
  }

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  double get minExtent => math.min(maxHeight, minHeight);

  @override
  bool shouldRebuild(_HeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
      minHeight != oldDelegate.minHeight ||
      child != oldDelegate.child;
  }
}