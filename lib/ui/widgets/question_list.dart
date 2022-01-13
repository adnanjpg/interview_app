import 'package:flutter/material.dart';
import 'package:interview/data/api/questions_api.dart';
import 'package:interview/models/question.dart';
import 'package:interview/ui/widgets/question_item.dart';

class QuestionList extends StatelessWidget {
  const QuestionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: pagination
    const page = 1, pageSize = 10;

    return FutureBuilder(
      future: QuestionsApi.list(currentPage: page),
      builder: (context, snp) {
        if (snp.hasError) {
          return Text(snp.error.toString());
        }

        if (snp.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (!snp.hasData) {
          // in case returned null
          return const SizedBox();
        }

        final data = snp.data as List<Question>;
        return ListView.builder(
          itemCount: pageSize,
          itemBuilder: (context, index) {
            final q = data[index];
            return QuestionItem(q);
          },
        );
      },
    );
  }
}
