// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionAdapter extends TypeAdapter<Question> {
  @override
  final int typeId = 0;

  @override
  Question read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Question(
      tags: (fields[0] as List?)?.cast<String>(),
      owner: fields[1] as QuestionOwner?,
      isAnswered: fields[2] as bool,
      viewCount: fields[3] as int?,
      answerCount: fields[4] as int?,
      score: fields[5] as int?,
      lastActivityDate: fields[6] as DateTime?,
      lastEditDate: fields[7] as DateTime?,
      questionId: fields[8] as int?,
      contentLicense: fields[9] as String?,
      link: fields[10] as String?,
      title: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Question obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.tags)
      ..writeByte(1)
      ..write(obj.owner)
      ..writeByte(2)
      ..write(obj.isAnswered)
      ..writeByte(3)
      ..write(obj.viewCount)
      ..writeByte(4)
      ..write(obj.answerCount)
      ..writeByte(5)
      ..write(obj.score)
      ..writeByte(6)
      ..write(obj.lastActivityDate)
      ..writeByte(7)
      ..write(obj.lastEditDate)
      ..writeByte(8)
      ..write(obj.questionId)
      ..writeByte(9)
      ..write(obj.contentLicense)
      ..writeByte(10)
      ..write(obj.link)
      ..writeByte(11)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
      questionId: json['question_id'] as int?,
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
