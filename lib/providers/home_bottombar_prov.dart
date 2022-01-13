import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/bottom_item_model.dart';
import '../ui/home/bookmarks_widget.dart';
import '../ui/home/home_wid/home_widget.dart';
import '../ui/home/home_wid/profile_widget.dart';
import '../ui/home/search_wid/search_widget.dart';
import '../ui/home/ask_widget.dart';
import '../ui/profiles/search_bar.dart';

const homeBottomItems = [
  BottomItemModel(
    translationKey: 'home',
    icon: Icons.home,
    type: HomeBottombarType.home,
    widget: HomeWidget(),
    appbar: ProfileWidget(),
  ),
  BottomItemModel(
    translationKey: 'search',
    icon: Icons.search,
    type: HomeBottombarType.search,
    widget: SearchWidget(),
    appbar: SearchBar(),
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
