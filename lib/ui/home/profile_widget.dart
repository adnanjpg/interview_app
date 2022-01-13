import 'package:flutter/material.dart';
import 'package:interview/models/question.dart';
import 'package:interview/models/question_owner.dart';
import 'package:interview/ui/questions/user_item.dart';

// should be fetched from auth info
const name = 'Adnan Fahed';
const accountId = 123;

class ProfileWidget extends StatelessWidget implements PreferredSizeWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserItem(
      isMe: true,
      owner:const QuestionOwner(
        accountId: accountId,
        userId: accountId,
        displayName: name,
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 200);
}
