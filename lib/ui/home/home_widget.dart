import 'package:flutter/material.dart';
import 'package:interview/ui/widgets/question_list.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const QuestionList();
  }
}
