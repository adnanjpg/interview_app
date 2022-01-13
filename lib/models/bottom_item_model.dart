import 'package:flutter/material.dart';

import '../enums/home_bottombar_items.dart';
export 'package:interview/enums/home_bottombar_items.dart';

class BottomItemModel {
  final HomeBottombarType type;
  final String translationKey;
  final IconData icon;
  final Widget widget;
  final PreferredSizeWidget? appbar;

  const BottomItemModel({
    required this.type,
    required this.translationKey,
    required this.icon,
    required this.widget,
    this.appbar,
  });
}
