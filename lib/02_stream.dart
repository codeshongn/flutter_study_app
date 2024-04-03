
import 'dart:async';

// stream 통신하기 

Future<int> sumStream(Stream<int> stream) async { // stream : 파이프 개념으로 값, 이벤트, 객체, 컬렉션, 맵, 오류 등 모든 유형의 데이터 전달
  var sum = 0;
  await for (var value in stream) {
    print('sumStream : $value');
    sum += value;
  }

  return sum;
}

Stream<int> countStream(int to) async* { // async* : 요청이 있을때마다 (lazily) 연산 수행
  for (int i = 1; i<= to; i++) {
    print('countStream : $i');
    yield i; // yield : return과 비슷하지만 반환 후 종료되는게 아니라 계속 남아있으면서 데이터를 넘겨줌
  }
}

main() async {
  var stream = countStream(10);
  var sum = await sumStream(stream);
  print(sum);
}