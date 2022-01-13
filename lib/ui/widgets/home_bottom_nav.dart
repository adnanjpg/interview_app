import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview/providers/home_bottombar_prov.dart';
import 'package:interview/utils/utils.dart';

class HomeBottomNav extends ConsumerWidget {
  const HomeBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(homeBottmbarProv);
    return BottomNavigationBar(
      onTap: (index) {
        ref.read(homeBottmbarProv.notifier).state = homeBottomItems[index];
      },
      items: homeBottomItems
          .map(
            (e) => BottomNavigationBarItem(
              label: getStr(e.translationKey),
              icon: Icon(e.icon),
            ),
          )
          .toList(),
      currentIndex: homeBottomItems.indexWhere(
        (element) => element.type == selected.type,
      ),
    );
  }
}
