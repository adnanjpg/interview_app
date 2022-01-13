import 'package:flutter/material.dart';
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
    final imgWid = _UserImg(_owner);
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
