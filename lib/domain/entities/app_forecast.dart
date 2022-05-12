import 'package:json_annotation/json_annotation.dart';
import 'package:weather_info/domain/entities/current.dart';
import 'package:weather_info/domain/entities/forecast.dart';
import 'package:weather_info/domain/entities/location.dart';

part 'app_forecast.g.dart';

@JsonSerializable()
class AppForecast {
  final Location location;
  final Current current;
  final Forecast forecast;

  AppForecast({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory AppForecast.fromJson(Map<String, dynamic> json) => _$AppForecastFromJson(json);
}
