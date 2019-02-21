import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_daydart/flutter_daydart.dart';


void main(){
  final daydart = new DayDart();
  final daydart2 = DayDart.fromDateTime(new DateTime.now());
  final now = new DateTime.now();
  final daydart3 = DayDart.fromString('2019-02-21');

  final fm = DayDart().format(fm: 'YYYY-MM-DD HH:mm:ss');
  
}
