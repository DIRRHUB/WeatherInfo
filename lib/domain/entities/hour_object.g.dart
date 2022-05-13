// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hour_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourObject _$HourObjectFromJson(Map<String, dynamic> json) => HourObject(
      time: json['time'] as String,
      currentTemp: (json['temp_c'] as num).toDouble(),
      condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
      windSpeed: (json['wind_kph'] as num).toDouble(),
    );
