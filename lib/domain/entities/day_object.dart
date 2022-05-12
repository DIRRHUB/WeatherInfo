import 'package:json_annotation/json_annotation.dart';
import 'package:weather_info/domain/entities/day.dart';

part 'day_object.g.dart';

@JsonSerializable()
class DayObject {
  final String date;
  final Day day;
  final List hour;

  DayObject({required this.date, required this.day, required this.hour});

  factory DayObject.fromJson(Map<String, dynamic> json) =>
      _$DayObjectFromJson(json);
}
