import 'package:flutter/material.dart';
import 'package:interview/ui/widgets/custom_avatar.dart';
import '../../models/question.dart';
import '../../models/question_owner.dart';
import 'package:intl/intl.dart';

class UserItem extends StatelessWidget {
  final QuestionOwner? owner;
  final Question? model;
  final bool isMe;
  const UserItem({this.model, this.owner, required this.isMe, Key? key})
      : assert(
          model != null || owner != null,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final _owner = owner ?? model?.owner;
    final imgWid = CustomAvatar(_owner?.profileImage);
    return ListTile(
      leading: isMe ? null : imgWid,
      title: Text(_owner?.displayName ?? ''),
      subtitle: Builder(
        builder: (context) {
          String out = '';

          if (isMe) {
            // data does not provide bio, so we are using accountId
            out = _owner?.accountId.toString() ?? '';
          } else {
            final f = DateFormat('yyyy-MM-dd');
            final dt = model?.lastEditDate;

            out = dt != null ? f.format(dt) : '';
          }

          return Text(out);
        },
      ),
      trailing: isMe ? imgWid : null,
    );
  }
}
