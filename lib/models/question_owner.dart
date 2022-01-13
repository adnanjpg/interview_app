import 'package:json_annotation/json_annotation.dart';
part 'question_owner.g.dart';

@JsonSerializable()
class QuestionOwner {
  @JsonKey(name: 'account_id')
  final int? accountId;
  final int? reputation;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'user_type')
  final String? userType;
  @JsonKey(name: 'accept_rate')
  final int? acceptRate;
  @JsonKey(name: 'profile_image')
  final String? profileImage;
  @JsonKey(name: 'display_name')
  final String? displayName;
  final String? link;

  const QuestionOwner({
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
