import 'package:flutter/material.dart';
import 'package:interview/models/question.dart';

class QuestionItem extends StatelessWidget {
  final Question model;
  const QuestionItem(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(model.score.toString());
  }
}
