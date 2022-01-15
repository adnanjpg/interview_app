import 'package:hive_flutter/hive_flutter.dart';

import 'question_owner.dart';
import 'package:json_annotation/json_annotation.dart';
part 'question.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class Question extends HiveObject {
  @HiveField(0)
  final List<String>? tags;
  @HiveField(1)
  final QuestionOwner? owner;

  @JsonKey(name: 'is_answered', defaultValue: false)
  @HiveField(2)
  final bool isAnswered;

  @JsonKey(name: 'view_count')
  @HiveField(3)
  final int? viewCount;

  @JsonKey(name: 'answer_count')
  @HiveField(4)
  final int? answerCount;

  @HiveField(5)
  final int? score;

  @JsonKey(name: 'last_activity_date', fromJson: _dateTimeFromJson)
  @HiveField(6)
  final DateTime? lastActivityDate;

  @JsonKey(name: 'last_edit_date', fromJson: _dateTimeFromJson)
  @HiveField(7)
  final DateTime? lastEditDate;

  @JsonKey(name: 'question_id')
  @HiveField(8)
  final int? questionId;

  @JsonKey(name: 'content_license')
  @HiveField(9)
  final String? contentLicense;

  @HiveField(10)
  final String? link;

  @HiveField(11)
  final String? title;

  Question({
    required this.tags,
    required this.owner,
    required this.isAnswered,
    required this.viewCount,
    required this.answerCount,
    required this.score,
    required this.lastActivityDate,
    required this.lastEditDate,
    required this.questionId,
    required this.contentLicense,
    required this.link,
    required this.title,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  static DateTime? _dateTimeFromJson(int? inp) =>
      inp != null ? DateTime.fromMillisecondsSinceEpoch(inp) : null;
}
