import 'package:interview/models/question_owner.dart';
import 'package:json_annotation/json_annotation.dart';
part 'question.g.dart';

@JsonSerializable()
class Question {
  final List<String>? tags;
  final QuestionOwner? owner;

  @JsonKey(name: 'is_answered', defaultValue: false)
  final bool isAnswered;

  @JsonKey(name: 'view_count')
  final int? viewCount;

  @JsonKey(name: 'answer_count')
  final int? answerCount;

  final int? score;

  @JsonKey(name: 'last_activity_date', fromJson: _dateTimeFromJson)
  final DateTime? lastActivityDate;
  @JsonKey(name: 'last_edit_date', fromJson: _dateTimeFromJson)
  final DateTime? lastEditDate;

  @JsonKey(name: 'question_id')
  final int questionId;
  @JsonKey(name: 'content_license')
  final String? contentLicense;

  final String? link;
  final String? title;

  const Question({
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

  static DateTime? _dateTimeFromJson(int? inp) =>
      inp != null ? DateTime.fromMillisecondsSinceEpoch(inp) : null;
}
