import 'package:json_annotation/json_annotation.dart';
import 'package:weather_info/domain/entities/condition.dart';

part 'day.g.dart';

@JsonSerializable()
class Day {
  @JsonKey(name: 'maxtemp_c')
  final double maxTemp;
  @JsonKey(name: 'mintemp_c')
  final double minTemp;
  @JsonKey(name: 'avgtemp_c')
  final double avgTemp;
  @JsonKey(name: 'maxwind_kph')
  final double maxWind;
  final Condition condition;

  Day({
    required this.maxTemp,
    required this.minTemp,
    required this.avgTemp,
    required this.maxWind,
    required this.condition,
  });

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
}
