// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Day _$DayFromJson(Map<String, dynamic> json) => Day(
      maxTemp: (json['maxtemp_c'] as num).toDouble(),
      minTemp: (json['mintemp_c'] as num).toDouble(),
      avgTemp: (json['avgtemp_c'] as num).toDouble(),
      maxWind: (json['maxwind_kph'] as num).toDouble(),
      condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'maxtemp_c': instance.maxTemp,
      'mintemp_c': instance.minTemp,
      'avgtemp_c': instance.avgTemp,
      'maxwind_kph': instance.maxWind,
      'condition': instance.condition,
    };
