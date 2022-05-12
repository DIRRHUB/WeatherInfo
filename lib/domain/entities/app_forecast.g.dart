// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppForecast _$AppForecastFromJson(Map<String, dynamic> json) => AppForecast(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      current: Current.fromJson(json['current'] as Map<String, dynamic>),
      forecast: Forecast.fromJson(json['forecast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppForecastToJson(AppForecast instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
      'forecast': instance.forecast,
    };
