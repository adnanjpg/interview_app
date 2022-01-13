import 'package:flutter/material.dart';
import 'package:interview/ui/widgets/home_bottom_nav.dart';
import 'package:interview/ui/widgets/profile_widget.dart';
import 'package:interview/ui/widgets/question_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ProfileWidget(),
      body: QuestionList(),
      bottomNavigationBar: HomeBottomNav(),
    );
  }
}
