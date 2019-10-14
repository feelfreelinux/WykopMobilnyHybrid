import 'package:flutter/material.dart';

class SizedSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double size;
  SizedSliverHeaderDelegate({this.builder, this.size = 60});

  final WidgetBuilder builder;

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