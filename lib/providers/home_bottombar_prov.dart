import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview/models/bottom_item_model.dart';
import 'package:interview/ui/screens/home/ask_widget.dart';
import 'package:interview/ui/screens/home/bookmarks_widget.dart';
import 'package:interview/ui/screens/home/home_widget.dart';
import 'package:interview/ui/screens/home/search_widget.dart';

const homeBottomItems = [
  BottomItemModel(
    translationKey: 'home',
    icon: Icons.home,
    type: HomeBottombarType.home,
    widget: HomeWidget(),
  ),
  BottomItemModel(
    translationKey: 'search',
    icon: Icons.search,
    type: HomeBottombarType.search,
    widget: SearchWidget(),
  ),
  BottomItemModel(
    translationKey: 'ask',
    icon: Icons.add,
    type: HomeBottombarType.ask,
    widget: AskWidget(),
  ),
  BottomItemModel(
    translationKey: 'bookmarks',
    icon: Icons.bookmark,
    type: HomeBottombarType.bookmarks,
    widget: BookmarksWidget(),
  ),
];

final homeBottmbarProv = StateProvider<BottomItemModel>(
  (ref) => homeBottomItems[0],
);