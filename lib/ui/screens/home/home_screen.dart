import 'package:flutter/material.dart';
import 'package:interview/ui/widgets/home_bottom_nav.dart';
import 'package:interview/ui/widgets/profile_widget.dart';

import 'home_page_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ProfileWidget(),
      body: HomePageBuilder(),
      bottomNavigationBar: HomeBottomNav(),
    );
  }
}
