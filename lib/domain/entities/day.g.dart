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
