// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayObject _$DayObjectFromJson(Map<String, dynamic> json) => DayObject(
      date: json['date'] as String,
      day: Day.fromJson(json['day'] as Map<String, dynamic>),
      hour: json['hour'] as List<dynamic>,
    );
