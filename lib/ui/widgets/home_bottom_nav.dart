import 'package:flutter/material.dart';
import 'package:interview/utils/utils.dart';

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <String, IconData>{
        'home': Icons.home,
        'search': Icons.search,
        'ask': Icons.add,
        'bookmarks': Icons.bookmark,
      }
          .entries
          .map(
            (e) => BottomNavigationBarItem(
              label: getStr(e.key),
              icon: Icon(e.value),
            ),
          )
          .toList(),
          
    );
  }
}
