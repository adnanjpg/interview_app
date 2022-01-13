import 'package:flutter/material.dart';
import 'package:interview/models/question.dart';
import 'package:interview/ui/questions/user_item.dart';
import 'package:interview/utils/utils.dart';

class QuestionItem extends StatelessWidget {
  final Question model;
  const QuestionItem(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: halfDefPaddingSize,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: UserItem(
                  model: model,
                  isMe: false,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.bookmark_outline,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: defPaddingSize,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title ?? '',
                  maxLines: 4,
                ),
                Row(
                  children: [
                    Text(
                      [
                        model.answerCount ?? 0,
                        getStr('answers'),
                      ].join(' '),
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Wrap(
                      children: (model.tags ?? [])
                          .map(
                            (e) => Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 2,
                              ),
                              child: Text(
                                '#' + e,
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ].map((e) {
                    return Expanded(child: e);
                  }).toList(),
                ),
              ].joinWidgetList(
                (index) {
                  return const SizedBox(
                    height: halfDefPaddingSize,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
