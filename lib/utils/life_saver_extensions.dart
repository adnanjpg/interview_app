import 'package:flutter/material.dart';

extension AdnanFlutterIterable<E> on Iterable<E> {
  List<Widget> joinWidgetList(Widget Function(int index) element) {
    assert(
      every(
        (element) {
          return element is Widget?;
        },
      ),
    );

    List<Widget> ls = () {
      final ls = <Widget>[];
      for (int i = 0; i < length; i++) {
        final element = elementAt(i);
        if (element != null && element is Widget) ls.add(element);
      }
      return ls;
    }();

    final List<Widget> output = [];

    for (var i = 0; i < ls.length; i++) {
      final el = ls.elementAt(i);

      output.add(el);

      // if not last element
      if (i != length - 1) {
        output.add(element(i));
      }
    }

    return output;
  }

}