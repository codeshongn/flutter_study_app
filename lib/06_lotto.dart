import 'dart:math' as math;
import 'dart:collection';

void main() {
  var rand = math.Random();
  HashSet<int> lotteryNumer = HashSet();

  while(lotteryNumer.length < 6) {
    lotteryNumer.add(rand.nextInt(45));
  }

  print(lotteryNumer);

}