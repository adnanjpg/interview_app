import 'package:flutter/material.dart';

final Map<String, String> _translations = {
  'home': 'Home',
  'search': 'Search',
  'ask': 'Ask',
  'bookmarks': 'Bookmarks',
};

/// this is going to be customized later to return
/// the translation in the selected app language.
String getStr(String key) {
  final val = _translations[key];

  // add assertion to help miswritten keys in debug
  assert(val != null);

  // but return '' (empty String) value as default,
  // to not crash in prod.
  return val ?? '';
}

const primary = Color(0xFF31326f),secondary =  Color(0xFF76abf1);

final ThemeData appTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: primary,
    secondary:secondary,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: primary,
    unselectedItemColor: secondary,
    showUnselectedLabels: true,
  ),
);
