import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview/providers/home_bottombar_prov.dart';
import 'package:interview/ui/home/home_bottom_nav.dart';

import 'home_page_builder.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(homeBottmbarProv);
    return SafeArea(
      child: Scaffold(
        appBar: selected.appbar ?? AppBar(),
        body: const HomePageBuilder(),
        bottomNavigationBar: const HomeBottomNav(),
      ),
    );
  }
}
