// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      owner: json['owner'] == null
          ? null
          : QuestionOwner.fromJson(json['owner'] as Map<String, dynamic>),
      isAnswered: json['is_answered'] as bool? ?? false,
      viewCount: json['view_count'] as int?,
      answerCount: json['answer_count'] as int?,
      score: json['score'] as int?,
      lastActivityDate:
          Question._dateTimeFromJson(json['last_activity_date'] as int?),
      lastEditDate: Question._dateTimeFromJson(json['last_edit_date'] as int?),
      questionId: json['question_id'] as int,
      contentLicense: json['content_license'] as String?,
      link: json['link'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'tags': instance.tags,
      'owner': instance.owner,
      'is_answered': instance.isAnswered,
      'view_count': instance.viewCount,
      'answer_count': instance.answerCount,
      'score': instance.score,
      'last_activity_date': instance.lastActivityDate?.toIso8601String(),
      'last_edit_date': instance.lastEditDate?.toIso8601String(),
      'question_id': instance.questionId,
      'content_license': instance.contentLicense,
      'link': instance.link,
      'title': instance.title,
    };
