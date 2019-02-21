import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_daydart/flutter_daydart.dart';
import 'package:flutter_daydart/src/Units.dart';


void main(){
  final daydart = new DayDart();
  final daydart2 = DayDart.fromDateTime(new DateTime.now());
  final now = new DateTime.now();
  final daydart3 = DayDart.fromString('2019-02-21');

  final fm = DayDart().format(fm: 'YYYY-MM-DD HH:mm:ss');

  // print(daydart);
  // print(daydart.add(1, Units.Y));
  // print(daydart.add(28, Units.M));
  // print(daydart.add(2, Units.H));

  print(daydart.subtract(1, Units.M));
  print(daydart.subtract(2, Units.M));
  print(daydart.subtract(13, Units.M).add(2, Units.H));
  print(daydart.subtract(15, Units.M));
  print(daydart.subtract(30, Units.M));
}
