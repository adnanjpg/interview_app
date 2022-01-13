// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionOwner _$QuestionOwnerFromJson(Map<String, dynamic> json) =>
    QuestionOwner(
      accountId: json['account_id'] as int,
      reputation: json['reputation'] as String,
      userId: json['user_id'] as int,
      userType: json['user_type'] as String,
      acceptRate: json['accept_rate'] as int,
      profileImage: json['profile_image'] as String,
      displayName: json['display_name'] as String,
      link: json['link'] as String,
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
