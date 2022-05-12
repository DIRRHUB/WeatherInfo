import 'package:json_annotation/json_annotation.dart';

part 'current.g.dart';

@JsonSerializable()
class Current {
  @JsonKey(name: 'temp_c')
  final double currentTemp;
  @JsonKey(name: 'wind_kph')
  final double windSpeed;

  Current({required this.currentTemp, required this.windSpeed});

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);
}
