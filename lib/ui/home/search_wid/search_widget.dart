import 'package:flutter/material.dart';
import '../../profiles/profiles_list.dart';
import '../../questions/question_list.dart';
import '../../../utils/utils.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mp = {
      'profile': const ProfilesList(),
      'post': QuestionList(
        scrollController: scrollController,
      ),
    };
    final ls = mp.entries.map(
      (e) {
        return [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: defPaddingSize),
            child: Text(
              getStr(e.key),
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          e.value,
        ].joinWidgetList(
          (index) {
            return const SizedBox(
              height: halfDefPaddingSize,
            );
          },
        );
      },
    );
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var item in ls) ...item,
        ],
      ),
    );
  }
}
