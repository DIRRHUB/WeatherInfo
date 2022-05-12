import 'package:json_annotation/json_annotation.dart';
import 'package:weather_info/domain/entities/condition.dart';

part 'hour_object.g.dart';

@JsonSerializable()
class HourObject {
  final String time;
  @JsonKey(name: 'temp_c')
  final double currentTemp;
  final Condition condition;
     @JsonKey(name: 'wind_kph')
  final double windSpeed;

  HourObject({
    required this.time,
    required this.currentTemp,
    required this.condition,
    required this.windSpeed,
  });

  factory HourObject.fromJson(Map<String, dynamic> json) =>
      _$HourObjectFromJson(json);
}
