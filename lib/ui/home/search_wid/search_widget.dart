import 'package:flutter/material.dart';
import 'package:interview/ui/profiles/profiles_list.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilesList(),
      ],
    );
  }
}
