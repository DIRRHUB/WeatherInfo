import 'package:json_annotation/json_annotation.dart';

part 'condition.g.dart';

@JsonSerializable()
class Condition {
  final String text;
  final String icon;

  Condition({required this.icon, this.text = ""});

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);
}
