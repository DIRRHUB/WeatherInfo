import 'package:flutter/material.dart';
import 'package:weather_info/domain/api_clients/dio_client.dart';
import 'package:weather_info/domain/entities/app_forecast.dart';
import 'package:weather_info/domain/entities/current.dart';
import 'package:weather_info/domain/entities/forecast.dart';
import 'package:weather_info/domain/entities/hour_info.dart';
import 'package:weather_info/domain/entities/location.dart';

class MainModel with ChangeNotifier {
  AppForecast? appForecast;
  String? geolocation;
  Location? location;
  Current? current;
  Forecast? forecast;
  List? forecastday;
  Map? todayObject;
  List<TimeInfo>? todayHoursInfo;
  String? stateForecast;
  String? tempMax, tempMin;
  List<TimeInfo>? daysTimeInfo;
  String? titleLocationString;

  AppForecast? get getAppForecast => appForecast;
  List? get getForecastday => forecastday;
  String? get getTodayStateForecast => stateForecast;
  String? get getTodayMinMaxTemperature =>
      "Min temp: " + (tempMin ?? "?") + ", Max temp: " + (tempMax ?? "?");

  set setGeolocation(String geolocation) => this.geolocation = geolocation;
  set setTitleLocationString(String value) {
    titleLocationString = value;
    notifyListeners();
  }

  void setInfo(AppForecast? appForecast) {
    this.appForecast = appForecast;
    processData();
    notifyListeners();
  }

  void processData() {
    forecast = appForecast?.forecast;
    location = appForecast?.location;
    current = appForecast?.current;
    forecastday = forecast?.forecastday;
    todayObject = forecastday![0];
    Map day = todayObject!['day'];
    List todayHours = todayObject!['hour'];
    Map condition = day['condition'];
    tempMax = day['maxtemp_c'].toString() + "°";
    tempMin = day['mintemp_c'].toString() + "°";
    stateForecast = condition['text'];
    todayHoursInfo = [];
    for (int i = 0; i < todayHours.length; i++) {
      Map hourObject = todayHours[i];
      String unconvertedTime = hourObject['time'];
      String temp = hourObject['temp_c'].toString() + "°";
      Map condition = hourObject['condition'];
      String unconvertedIconCode = condition['icon'];
      String wind = hourObject['wind_kph'].toString();
      String time = unconvertedTime.substring(10, 16);
      AssetImage imageCode = convertStringToIcon(unconvertedIconCode);
      todayHoursInfo?.add(
          TimeInfo(time: time, temp: temp, wind: wind, imageCode: imageCode));
    }

    daysTimeInfo = [];
    for (int i = 0; i < DioClient.days; i++) {
      Map? dayObject = forecastday![i];
      String date = dayObject!['date'];
      date = date.substring(5, 10);
      Map day = dayObject['day'];
      String avgTemp = day['avgtemp_c'].toString() + "°";
      String maxWind = day['maxwind_kph'].toString();
      Map condition = day['condition'];
      String unconvertedIconCode = condition['icon'];
      AssetImage imageCode = convertStringToIcon(unconvertedIconCode);
      daysTimeInfo?.add(TimeInfo(
          time: date, temp: avgTemp, wind: maxWind, imageCode: imageCode));
    }
  }

  AssetImage convertStringToIcon(String unconvertedIconCode) {
    AssetImage imageCode;
    if (unconvertedIconCode.contains("day")) {
      imageCode = AssetImage(
          "assets/images/day/" + unconvertedIconCode.substring(39, 46));
    } else {
      imageCode = AssetImage(
          "assets/images/night/" + unconvertedIconCode.substring(41, 48));
    }
    return imageCode;
  }
}
