import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_daydart/flutter_daydart.dart';
import 'package:flutter_daydart/src/Units.dart';


void main(){
  final daydart = new DayDart();
  final daydart2 = DayDart.fromDateTime(new DateTime.now());
  final now = new DateTime.now();
  final daydart3 = DayDart.fromString('2019-02-21');
  final daydart4 =  DayDart.fromString('2018-02-21');

  test('format-> 测试格式化YYYY-MM-DD', (){
    final fm = daydart3.format(fm: 'YYYY-MM-DD');
    expect(fm, '2019-02-21');
  });

  test('isAfterValue-> 测试2018在2019之后', () {
    bool isD = daydart3.isAfterValue(2018, Units.Y);
    expect(isD, true);
  });

  test('isBeforeValue-> 测试2020在2019之前', (){
    bool isD = daydart3.isBeforeValue(2020, Units.Y);
    expect(isD, true);
  });

  test('isSameValue-> 测试2019是否等于当前的年', (){
    bool isD = daydart3.isSameValue(2019, Units.Y);
    expect(isD, true);
  });

  test('static isDayDart-> 测试传入一个对象是否是 DayDart', (){
    expect(DayDart.isDayDart(daydart), true);
  });
}
