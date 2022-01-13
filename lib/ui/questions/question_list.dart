import 'package:flutter/material.dart';
import 'package:interview/data/api/questions_api.dart';
import 'package:interview/paginationer/src/default_paginationer.dart';

import 'question_item.dart';
import 'package:interview/utils/utils.dart';

class QuestionList extends StatelessWidget {
  const QuestionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Paginationer(
      emptyChildren: const [Center(child: CircularProgressIndicator())],
      future: (currentPage) async {
        final data = await QuestionsApi.list(currentPage: currentPage);

        if (data == null || data.isEmpty) {
          return [];
        }

        return data.map(
          (q) {
            return QuestionItem(q);
          },
        ).joinWidgetList(
          (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: defPaddingSize),
              child: const Divider(),
            );
          },
        );
      },
    );
  }
}
