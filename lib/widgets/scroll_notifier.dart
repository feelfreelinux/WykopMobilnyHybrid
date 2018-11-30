import 'package:flutter/material.dart';

class ScrollNotifier extends InheritedWidget {
  final double pixels;

  ScrollNotifier({this.pixels, child}) : super(child: child);

  @override
  bool updateShouldNotify(ScrollNotifier old) => old.pixels != this.pixels;

  static ScrollNotifier of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ScrollNotifier) as ScrollNotifier;
  }
}
