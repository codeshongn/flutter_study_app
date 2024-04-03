
import 'dart:async';

// stream 통신하기 - then() 활용 

main() async {
  var stream = Stream.fromIterable([1,null,3,4,10]);

  stream.first.then((value) => print('first: $value'));
  stream.last.then((value) => print('last: $value'));
  stream.isEmpty.then((value) => print('isEmpty: $value'));
  stream.length.then((value) => print('length: $value'));
}