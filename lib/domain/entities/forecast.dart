import 'package:json_annotation/json_annotation.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  final List forecastday;

  Forecast({required this.forecastday});

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
}
