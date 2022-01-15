import 'package:flutter/material.dart';
import '../../../models/question_owner.dart';
import '../../questions/user_item.dart';

// should be fetched from auth info
const name = 'Adnan Fahed';
const accountId = 123;

class ProfileWidget extends StatelessWidget implements PreferredSizeWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserItem(
      isMe: true,
      owner: QuestionOwner(
        accountId: accountId,
        userId: accountId,
        displayName: name,
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 200);
}
