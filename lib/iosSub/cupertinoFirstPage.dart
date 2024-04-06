import 'package:flutter/cupertino.dart';
import 'package:flutter_test_app/animalItem.dart';

class CupertinoFirstPage extends StatelessWidget {
  final List<Animal> list;
  const CupertinoFirstPage({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: Text('동물 리스트'),),
        child: ListView.builder(
          itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(5),
            height: 100,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(list[index].imagePath!,
                    fit: BoxFit.contain,
                    width: 80,
                    height: 80,),
                  Text(list[index].animalName!),
                  ],
                  ),
                  Container(
                    height: 2,
                    color: CupertinoColors.black,
                  )
              ],
            ));
        },
        itemCount: list.length,
      ) 
    );
  }
}