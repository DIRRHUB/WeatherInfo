// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Current _$CurrentFromJson(Map<String, dynamic> json) => Current(
      currentTemp: (json['temp_c'] as num).toDouble(),
      windSpeed: (json['wind_kph'] as num).toDouble(),
    );

Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
      'temp_c': instance.currentTemp,
      'wind_kph': instance.windSpeed,
    };
