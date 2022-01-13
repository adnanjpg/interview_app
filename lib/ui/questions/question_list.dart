import 'package:flutter/material.dart';
import 'package:interview/data/api/questions_api.dart';
import 'package:interview/models/question.dart';
import 'package:interview/paginationer/paginationer.dart';
import 'package:interview/paginationer/src/default_paginationer.dart';

import 'question_item.dart';
import 'package:interview/utils/utils.dart';

class QuestionList extends StatefulWidget {
  final ScrollController? scrollController;
  const QuestionList({this.scrollController, Key? key}) : super(key: key);

  @override
  State<QuestionList> createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  final List<Question> questions = [];

  @override
  Widget build(BuildContext context) {
    return Paginationer(
      primary: false,
      controller: widget.scrollController,
      type: PaginationerType.ItemBased,
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
