import 'package:flutter/material.dart';

class SizedSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final WidgetBuilder builder;
  final double size;

  SizedSliverHeaderDelegate({this.builder, this.size = 44});

  @override
  double get minExtent => size;
  @override
  double get maxExtent => minExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return builder(context);
  }

  @override
  bool shouldRebuild(SizedSliverHeaderDelegate oldDelegate) {
    return false;
  }
}
