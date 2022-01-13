import 'package:flutter/material.dart';
import 'package:interview/models/question.dart';
import 'package:interview/models/question_owner.dart';
import 'package:intl/intl.dart';

class UserItem extends StatelessWidget {
  final Question model;
  final bool isMe;
  const UserItem({required this.model, required this.isMe, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final owner = model.owner;
    final imgWid = _UserImg(owner);
    return ListTile(
      leading: isMe ? null : imgWid,
      title: Text(owner?.displayName ?? ''),
      subtitle: Builder(builder: (context) {
        final f = DateFormat('yyyy-MM-dd');
        final dt = model.lastEditDate;

        final out = dt != null ? f.format(dt) : '';

        return Text(out);
      }),
      trailing: isMe ? imgWid : null,
    );
  }
}

class _UserImg extends StatelessWidget {
  final QuestionOwner? model;

  const _UserImg(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final img = model?.profileImage;
        if (img == null) {
          return CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
          );
        }
        return CircleAvatar(
          backgroundImage: NetworkImage(img),
        );
      },
    );
  }
}
