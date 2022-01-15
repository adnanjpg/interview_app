import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'question_owner.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class QuestionOwner extends HiveObject {
  @JsonKey(name: 'account_id')
  @HiveField(0)
  final int? accountId;

  @HiveField(1)
  final int? reputation;

  @JsonKey(name: 'user_id')
  @HiveField(2)
  final int? userId;

  @JsonKey(name: 'user_type')
  @HiveField(3)
  final String? userType;

  @JsonKey(name: 'accept_rate')
  @HiveField(4)
  final int? acceptRate;

  @JsonKey(name: 'profile_image')
  @HiveField(5)
  final String? profileImage;

  @JsonKey(name: 'display_name')
  @HiveField(6)
  final String? displayName;

  @HiveField(7)
  final String? link;

  QuestionOwner({
    required this.accountId,
    required this.userId,
    this.reputation,
    this.userType,
    this.acceptRate,
    this.profileImage,
    this.displayName,
    this.link,
  });

  factory QuestionOwner.fromJson(Map<String, dynamic> json) =>
      _$QuestionOwnerFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionOwnerToJson(this);
}
