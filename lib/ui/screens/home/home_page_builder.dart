import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview/providers/home_bottombar_prov.dart';

class HomePageBuilder extends ConsumerWidget {
  const HomePageBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentItem = ref.watch(homeBottmbarProv);

    return currentItem.widget;
  }
}
