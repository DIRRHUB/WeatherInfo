import 'package:flutter/material.dart';
import 'package:weather_info/domain/api_clients/dio_client.dart';
import 'package:weather_info/domain/entities/app_forecast.dart';
import 'package:weather_info/domain/entities/current.dart';
import 'package:weather_info/domain/entities/forecast.dart';
import 'package:weather_info/domain/entities/hour_info.dart';
import 'package:weather_info/domain/entities/location.dart';

class MainModel with ChangeNotifier {
  AppForecast? appForecast = AppForecast();
  Location? location;
  Current? current;
  Forecast? forecast;
  List? forecastday;
  Map? todayObject;
  List<HourInfo>? todayHoursInfo;
  String? stateForecast;
  String? tempMax, tempMin;

  final DioClient _client = DioClient();

  AppForecast? get getAppForecast => appForecast;
  List? get getForecastday => forecastday;
  String? get getTodayStateForecast => stateForecast;
  String? get getTodayMinMaxTemperature =>
      "Max temp: " + (tempMax ?? "?") + ", Min temp: " + (tempMin ?? "");

  void getInfo(String locationString) async {
    appForecast = await _client.getInfo(locationString);
    processDate();
    notifyListeners();
  }

  void setInfo(AppForecast? appForecast) {
    this.appForecast = appForecast;
    processDate();
  }

  void processDate() {
    forecast = appForecast?.forecast;
    location = appForecast?.location;
    current = appForecast?.current;
    forecastday = forecast?.forecastday;
    todayObject = forecastday![0];
    Map day = todayObject!['day'];
    List todayHours = todayObject!['hour'];
    Map condition = day['condition'];
    tempMax = day['maxtemp_c'].toString();
    tempMin = day['mintemp_c'].toString();
    stateForecast = condition['text'];
    todayHoursInfo = [];
    for (int i = 0; i < todayHours.length; i++) {
      Map hourObject = todayHours[i];
      String unconvertedTime = hourObject['time'];
      String temp = hourObject['temp_c'].toString();
      Map condition = hourObject['condition'];
      String unconvertedIconCode = condition['icon'];
      String wind = hourObject['wind_kph'].toString();

      String time = unconvertedTime.substring(10, 16);
      AssetImage imageCode;
      if (unconvertedIconCode.contains("day")) {
        imageCode = AssetImage(
            "assets/images/day/" + unconvertedIconCode.substring(39, 46));
      } else {
        imageCode = AssetImage(
            "assets/images/night/" + unconvertedIconCode.substring(41, 48));
      }
      todayHoursInfo?.add(
          HourInfo(hour: time, temp: temp, wind: wind, imageCode: imageCode));
    }
  }
}
