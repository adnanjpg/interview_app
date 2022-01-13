import 'package:json_annotation/json_annotation.dart';
part 'question_owner.g.dart';

@JsonSerializable()
class QuestionOwner {
  @JsonKey(name: 'account_id')
  final int accountId;
  final String reputation;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'user_type')
  final String userType;
  @JsonKey(name: 'accept_rate')
  final int acceptRate;
  @JsonKey(name: 'profile_image')
  final String profileImage;
  @JsonKey(name: 'display_name')
  final String displayName;
  final String link;

  const QuestionOwner({
    required this.accountId,
    required this.reputation,
    required this.userId,
    required this.userType,
    required this.acceptRate,
    required this.profileImage,
    required this.displayName,
    required this.link,
  });

  factory QuestionOwner.fromJson(Map<String, dynamic> json) =>
      _$QuestionOwnerFromJson(json);
}