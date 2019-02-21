# DayDart

A new Flutter package project.

![https://img.shields.io/github/license/icepy/flutter_daydart.svg](https://img.shields.io/github/license/icepy/flutter_daydart.svg)
![https://img.shields.io/github/issues/icepy/flutter_daydart.svg](https://img.shields.io/github/issues/icepy/flutter_daydart.svg)

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.io/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

## API

`DayDart` 对象是不可变的，所有的调用都将返回一个新的 `DayDart` 对象。

- [解析](#解析)
  - [当前时间](#当前时间)
  - [原生创建](#原生创建)
  - [时间字符串](#时间字符串)
  - [DateTime 对象](#DateTime-对象)
  - [复制](#复制)
  - [验证](#验证)
- [获取](#获取)
  - [年](#年)
  - [月](#月)
  - [日](#日)
  - [星期](#星期)
  - [时](#时)
  - [分](#分)
  - [秒](#秒)
  - [毫秒](#毫秒)
- [操作](#操作)
  - [增加](#增加)
  - [减少](#减少)
- [查询](#查询)
  - [是否之前](#是否之前)
  - [是否之后](#是否之后)
- [显示](#显示)
  - [格式化](#格式化)
  - [DateTime 对象](#DateTime-对象)
  - [ISO 8601 字符串](#ISO-8601-字符串)
  - [List](#List)
  - [Map](#Map)
  - [字符串](#字符串)

----

### 解析

在 `DayDart` 中传入支持的格式。

#### 当前时间

直接运行 `DayDart` 获取当前时间和日期的 `DayDart` 对象。

```dart
DayDart()
```

#### 原生创建

可以像 DateTime 一样的创建 DayDart 对象

```dart
DayDart(2019,12,12);
```

#### 时间字符串

传入的一个标准的ISO 8601时间字符串。

```dart
DayDart.fromString('2019-02-21');
```

#### DateTime 对象

传入的一个 DateTime 对象。

```dart
DayDart.fromDateTime(new DateTime.now());
```

#### 复制

`DayDart` 对象是不可变的，因此可以执行 `.clone()` 来获取一个 DayDart 对象的拷贝。

```dart
DayDart().clone();
```

#### 验证

- return bool

检测当前的 DayDart 对象是否是一个有效的时间。

```dart
DayDart().isValid();
```

### 获取

获取日期

#### 年

- return int

获取年份。

```dart
DayDart().year();
```

#### 月

- return int

获取月份

```dart
DayDart().month();
```

#### 日

- return int

获取日期。

```dart
DayDart().date();
```

#### 星期

- return int

获取星期。

```dart
DayDart().day();
```

#### 时

- return int

获取小时。

```dart
DayDart().hour();
```

#### 分

- return int

获取分钟。

```dart
DayDart().minute();
```

#### 秒

- return int

获取秒。

```dart
DayDart().second();
```

#### 毫秒

- return int

获取毫秒。

```dart
DayDart().millisecond();
```

### 操作

我们可以对 `DayDart` 对象增加如下的操作：

```dart
DayDart().add(2, Units.H).subtract(13, Units.M);
```

#### 增加

为时间日期进行增加并返回一个新的 `DayDart` 对象。

```dart
DayDart().add(2, Units.H);
```

#### 减少

为时间日期进行减少并返回一个新的 `DayDart` 对象。

```dart
DayDart().subtract(13, Units.M)
```

### 查询

#### 是否之前

- return bool

检查另外一个 DayDart 对象是否在当前 DayDart 对象时间之前

```dart
DayDart().isBefore(daydart);
```

#### 是否之后

- return bool

检查另外一个 DayDart 对象是否在当前 DayDart 对象时间之后

```dart
DayDart().isAfter(daydart);
```

### 显示

格式化 DayDart 对象并展示。

#### 格式化

- return String

```dart
DayDart().format(fm: 'YYYY-MM-DD HH:mm:ss');
```

详情如下：

| Format | Output           | Description                  |
| ------ | ---------------- | ---------------------------- |
| `YY`   | 19               | 两位数的年份                   |
| `YYYY` | 2019             | 四位数的年份                   |
| `M`    | 1-12             | 月份，从 1 开始                |
| `MM`   | 01-12            | 月份，两位数                |
| `D`   | 1-31            | 月份里的一天               |
| `DD`   | 01-31            | 月份里的一天，两位数               |
| `H`   | 0-23            | 小时               |
| `HH`   | 00-23            | 小时，两位数            |
| `m`   | 0-59            | 分钟            |
| `mm`   | 00-59            | 分钟，两位数            |
| `s`   | 0-59           | 秒          |
| `ss`   | 00-59           | 秒，两位数        |
| `a`   | am pm          |        |
| `A`   | AM PM          |       |


#### DateTime 对象

- return DateTime

返回原生 DateTime 对象

```dart
DayDart().toDateTime();
```

#### ISO 8601 字符串

- return String

返回 ISO8601 格式的字符串。

```dart
DayDart().toISOString();
```

#### List

- return List<int>

返回包含时间数值的 List。

```dart
DayDart().toList();
```

#### Map

- return Map<String, int>

返回包含时间数值的 Map。

```dart
DayDart().toMap();
```

#### 字符串

- return String

```dart
DayDart().toString();
```