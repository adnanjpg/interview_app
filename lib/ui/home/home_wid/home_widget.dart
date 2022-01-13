import 'package:flutter/material.dart';
import '../../questions/question_list.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const QuestionList();
  }
}
