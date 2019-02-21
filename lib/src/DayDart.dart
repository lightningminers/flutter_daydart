import 'dart:core';
import 'package:flutter_daydart/src/utils.dart';


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
  DayDart clone(){
    return wrapper(toDateTime());
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
}
