import 'package:flutter/material.dart';
import 'package:interview/ui/screens/home_screen.dart';

import 'utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
