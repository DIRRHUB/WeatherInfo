import 'package:flutter/material.dart';

class TimeInfo {
  String time;
  String temp;
  String wind;
  AssetImage imageCode;

  TimeInfo({
    required this.time,
    required this.temp,
    required this.wind,
    required this.imageCode,
  });
}
