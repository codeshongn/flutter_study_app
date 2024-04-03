import 'dart:convert';

// 0. test
// printInteger(int aNumber) {
//   print('The number is $aNumber.');
// }

// 1. 출력해 보기
// main() {
//   var number = 42; // var = 자료형을 특정하지 않고 변수를 선언. 자료형을 특정하고 싶다면 int, String, double등 사용
//   printInteger(number);
// }

// 2. Null safety
// int? couldReturnNullButDoent() => -3;
// main() {
//   int? couldBeNullButIsnt = 1;
//   List<int?> listThatCouldHoldNulls = [2, null, 4];
//   // List<int?> nullsList;
//   int a = couldBeNullButIsnt;
//   // int b = listThatCouldHoldNulls.first;
//   int b = listThatCouldHoldNulls.first!;
//   // int c = couldReturnNullButDoent().abs();
//   int c = couldReturnNullButDoent()!.abs();

//   print('a is $a.');
//   print('b is $b.');
//   print('c is $c.');
// }

// 3. 비동기 처리 - 호출시 await을 붙이지 않으면 실행 순서가 바뀜
// void main() {
//   checkVersion();
//   print('end process');
// }

// Future checkVersion() async {
//   var version = await lookUpVersion();
//   print(version);
// }

// int lookUpVersion() {
//   return 12;
// }

// 4. 비동기 값 활용 - await
// void main() async {
//   await checkVersion().then((value) => {
//     print(value)
//   });
//   print('end process');
// }

// Future<String> checkVersion() async {
//   var version = await lookUpVersion();
//   return version;
// }

// String lookUpVersion() {
//   return 'Android Q';
// }

// 5. json data decode
// void main() {
//   var jsonString = '''[
//     {"score": 40},
//     {"score": 50},
//     {"score": 70}
//   ]''';

//   var scores = jsonDecode(jsonString);
//   print(scores is List);
//   var firstScore = scores[0];
//   print(firstScore is Map);
//   print(firstScore['score'] == 40);
// }

// 6. json data encode
void main() {
  var scores = [
    {'score': 40},
    {'score': 80},
    {'score': 100, 'overtime': true, 'special_guest': null}
  ];

  var jsonText = jsonEncode(scores);
  print(jsonText);
}