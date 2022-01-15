import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:interview/providers/connectivity_prov.dart';
import '../../data/api/questions_api.dart';
import '../../models/question.dart';
import '../../paginationer/paginationer.dart';

import 'question_item.dart';
import '../../utils/utils.dart';

class QuestionList extends ConsumerStatefulWidget {
  final ScrollController? scrollController;
  const QuestionList({this.scrollController, Key? key}) : super(key: key);

  @override
  ConsumerState<QuestionList> createState() => _QuestionListState();
}

class _QuestionListState extends ConsumerState<QuestionList> {
  final List<Question> questions = [];

  @override
  Widget build(BuildContext context) {
    final connected = ref.watch(connectionProvider);

    final qBox = Hive.box<Question>(questionsBoxKey);

    return Paginationer(
      primary: false,
      controller: widget.scrollController,
      type: PaginationerType.itemBased,
      emptyChildren: const [
        Center(
          child: CircularProgressIndicator(),
        ),
      ],
      future: (currentPage) async {
        List<Question> data = [];

        // if not connected and we're loading the first time, then show offline questions
        // else return empty to not load more
        if (!connected) {
          if (currentPage == 1) {
            data = qBox.values.toList();
          }
        } else {
          if (currentPage == 1) {
            // clear prev saved questions on the first load
            qBox.clear();
          }

          data = await QuestionsApi.list(currentPage: currentPage) ?? [];

          // store questions
          qBox.addAll(data);
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
