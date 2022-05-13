// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppForecast _$AppForecastFromJson(Map<String, dynamic> json) => AppForecast(
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      current: json['current'] == null
          ? null
          : Current.fromJson(json['current'] as Map<String, dynamic>),
      forecast: json['forecast'] == null
          ? null
          : Forecast.fromJson(json['forecast'] as Map<String, dynamic>),
    );
