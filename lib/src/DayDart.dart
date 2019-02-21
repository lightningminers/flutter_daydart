import 'dart:core';
import 'package:flutter_daydart/src/utils.dart';
import 'package:flutter_daydart/src/Units.dart';


const String FORMAT_DEFAULT = 'YYYY-MM-DDTHH:mm:ss';

DayDart wrapper(DateTime date) {
  return DayDart.fromDateTime(date);
}

class DayDart {

  DateTime _date;

  DayDart(){
    this._date = new DateTime.now();
  }

  DayDart.fromDateTime(DateTime date){
    this._date = date;
  }

  DayDart.fromString(String iso8601){
    this._date = DateTime.parse(iso8601);
  }

  DayDart.fromInt(int year,
      [int month = 1,
      int day = 1,
      int hour = 0,
      int minute = 0,
      int second = 0,
      int millisecond = 0,
      int microsecond = 0]){
        this._date = DateTime(year, month, day, hour, minute, second, millisecond, microsecond);
      }
  
  static bool isDayDart(daydart){
    return daydart is DayDart;
  }

  /**
   * 检测当前 DayDart 对象是一个有效的 DateTime
   */
  bool isValid(){
    return _date is DateTime;
  }

  /**
   * 获取年
   */
  int year(){
    return _date.year;
  }

  /**
   * 获取月
   */
  int month(){
    return _date.month;
  }

  /**
   * 获取日
   */
  int date(){
    return _date.day;
  }

  /**
   * 获取星期
   */
  int day(){
    return _date.weekday;
  }

  /**
   * 获取小时
   */
  int hour(){
    return _date.hour;
  }

  /**
   * 获取分钟
   */
  int minute(){
    return _date.minute;
  }

  /**
   * 获取秒
   */
  int second(){
    return _date.second;
  }

  /**
   * 获取毫秒
   */
  int millisecond(){
    return _date.millisecond;
  }

  /**
   * 返回包含时间数值的 List
   */
  List<int> toList(){
    return [
      _date.year,
      _date.month,
      _date.day,
      _date.hour,
      _date.minute,
      _date.second,
      _date.millisecond,
    ];
  }

  /**
   * 返回 ISO8601 格式的字符串
   */
  String toISOString(){
    return _date.toIso8601String();
  }

  /**
   * 返回时间对象的字符串
   */
  String toString(){
    return _date.toString();
  }

  /**
   * 返回当前的 DateTime 对象
   */
  DateTime toDateTime(){
    return _date;
  }

  /**
   * 返回包含时间数值的 Map
   */
  Map<String, int> toMap(){
    return {
      'years':_date.year,
      'months':_date.month,
      'date':_date.day,
      'hours':_date.hour,
      'minutes':_date.minute,
      'seconds':_date.second,
      'milliseconds':_date.millisecond,
    };
  }

  /**
   * 复制 DayDart 对象
   */
  DayDart clone([DateTime dateTime]){
    if (dateTime !=null) {
      return wrapper(dateTime);
    } else {
      return wrapper(toDateTime());
    }
  }

  /**
   * 接收一系列的时间日期字符串并替换成相应的值
   */
  String format({ String fm = FORMAT_DEFAULT }){
    final y = year().toString();
    final mh = month().toString();
    final d = date().toString();
    final h = hour().toString();
    final m = minute().toString();
    final s = second().toString();

    final matches = {
      'YYYY':y,
      'YY':y.substring(y.length - 2, y.length),
      'M':mh,
      'MM':addZero(mh),
      'D':d,
      'DD':addZero(d),
      'H':h,
      'HH':addZero(h),
      'm':m,
      'mm':addZero(m),
      's':s,
      'ss':addZero(s),
      'a':hour() < 12 ? 'am' : 'pm',
      'A':hour() < 12 ? 'AM' : 'PM',
    };
    return fm.replaceAllMapped(new RegExp(r'\[.*?\]|Y{2,4}|M{1,4}|D{1,2}|d{1,4}|H{1,2}|h{1,2}|a|A|m{1,2}|s{1,2}|Z{1,2}|SSS'), (Match m){
      final match = m.group(0);
      if (match.indexOf('[') > -1){
        return match.replaceAll(new RegExp(r'\[|\]'), '');
      }
      return matches[match];
    });
  }

  /**
   * 检查另外一个 DayDart 对象是否与当前 DayDart 对象的时间相等
   */
  isSame(DayDart that, Units units){
    
  }

  /**
   * 检查另外一个 DayDart 对象是否在当前 DayDart 对象时间之后
   */
  isAfter(DayDart that){
    return _date.isAfter(that.toDateTime());
  }

  /**
   * 检查另外一个 DayDart 对象是否在当前 DayDart 对象时间之前
   */
  isBefore(DayDart that){
    return _date.isBefore(that.toDateTime());
  }

  /**
   * 操作时间-增加
   */
  DayDart add(int num, Units unit){
    int y = year();
    int m = month();
    int d = date();
    int h = hour();
    int min = minute();
    int s = second();
    int ms = millisecond();
    switch (unit) {
      case Units.Y:
        return clone(new DateTime(
          y + num,
          m,
          d,
          h,
          min,
          s,
          ms
        ));
        break;
      case Units.M:
          int afterMonth = m + num;
          if (afterMonth <= 12) {
            // 小于或等于 12 还是当年
            return clone(new DateTime(y, afterMonth, d, h, min, s, ms));
          } else {
            // 大于12 就是第二年了
            int ad = 12 - m;
            int bv = num - ad;
            y = y + 1;
            if ((bv/12) < 1) {
              return clone(new DateTime(y, bv, d, h, min, s, ms));
            } else {
              double dY = bv / 12;
              int newY = dY.floor();
              int absMonth = newY * 12;
              int newMonth = bv - absMonth;
              y = y + newY;
              return clone(new DateTime(y, newMonth, d, h, min, s, ms));
            }
          }
        break;
      case Units.D:
        return clone(_date.add(new Duration(days: num)));
        break;
      case Units.H: 
        return clone(_date.add(new Duration(hours:num)));
        break;
      case Units.MIN:
        return clone(_date.add(new Duration(minutes:num)));
        break;
      case Units.S:
        return clone(_date.add(new Duration(seconds: num)));
        break;
      case Units.MS:
        return clone(_date.add(new Duration(milliseconds:num)));
        break;
      default:
    }
  }

  /**
   * 操作时间-减少
   */
  DayDart subtract(int num, Units unit){
    int y = year();
    int m = month();
    int d = date();
    int h = hour();
    int min = minute();
    int s = second();
    int ms = millisecond();
    switch (unit) {
      case Units.Y:
        return clone(new DateTime(
          y - num,
          m,
          d,
          h,
          min,
          s,
          ms
        ));
        break;
      case Units.M:
        double dY = num / 12;
        if (dY < 1){
          // 说明减的月数没有超过一年
          int rangeM = m - num;
          if (rangeM < 0) {
            y = y - 1;
            m = 12 + rangeM;
            return clone(new DateTime(
              y,
              m,
              d,
              h,
              min,
              s,
              ms
            ));
          } else {
            return clone(new DateTime(
              y,
              rangeM,
              d,
              h,
              min,
              s,
              ms
            ));
          }
        } else {
          // 减的月数超过了一年
          int cY = dY.ceil();
          int bY = dY.floor();
          int cMonth = num - (12 * bY);
          int rangeM = m - cMonth;
          if (rangeM < 0) {
            m = 12 + rangeM;
            return clone(new DateTime(
              y - cY,
              m,
              d,
              h,
              min,
              s,
              ms
            ));
          } else {
            return clone(new DateTime(
              y - bY,
              rangeM,
              d,
              h,
              min,
              s,
              ms
            ));
          }
        }
        break;
      case Units.D:
        return clone(_date.subtract(new Duration(days: num)));
        break;
      case Units.H: 
        return clone(_date.subtract(new Duration(hours:num)));
        break;
      case Units.MIN:
        return clone(_date.subtract(new Duration(minutes:num)));
        break;
      case Units.S:
        return clone(_date.subtract(new Duration(seconds: num)));
        break;
      case Units.MS:
        return clone(_date.subtract(new Duration(milliseconds:num)));
        break;
      default:
    }
  }
}
