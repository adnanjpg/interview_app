// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_owner.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionOwnerAdapter extends TypeAdapter<QuestionOwner> {
  @override
  final int typeId = 1;

  @override
  QuestionOwner read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuestionOwner(
      accountId: fields[0] as int?,
      userId: fields[2] as int?,
      reputation: fields[1] as int?,
      userType: fields[3] as String?,
      acceptRate: fields[4] as int?,
      profileImage: fields[5] as String?,
      displayName: fields[6] as String?,
      link: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, QuestionOwner obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.accountId)
      ..writeByte(1)
      ..write(obj.reputation)
      ..writeByte(2)
      ..write(obj.userId)
      ..writeByte(3)
      ..write(obj.userType)
      ..writeByte(4)
      ..write(obj.acceptRate)
      ..writeByte(5)
      ..write(obj.profileImage)
      ..writeByte(6)
      ..write(obj.displayName)
      ..writeByte(7)
      ..write(obj.link);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionOwnerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionOwner _$QuestionOwnerFromJson(Map<String, dynamic> json) =>
    QuestionOwner(
      accountId: json['account_id'] as int?,
      userId: json['user_id'] as int?,
      reputation: json['reputation'] as int?,
      userType: json['user_type'] as String?,
      acceptRate: json['accept_rate'] as int?,
      profileImage: json['profile_image'] as String?,
      displayName: json['display_name'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$QuestionOwnerToJson(QuestionOwner instance) =>
    <String, dynamic>{
      'account_id': instance.accountId,
      'reputation': instance.reputation,
      'user_id': instance.userId,
      'user_type': instance.userType,
      'accept_rate': instance.acceptRate,
      'profile_image': instance.profileImage,
      'display_name': instance.displayName,
      'link': instance.link,
    };
