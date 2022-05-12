import 'dart:convert';

import 'package:weather_info/domain/entities/app_forecast.dart';

class JsonCoder {
  String string = "";
  void decode() {
    Map<String, dynamic> jsonMap = jsonDecode(string);
    var result = AppForecast.fromJson(jsonMap);
    print(result);
  }
}
