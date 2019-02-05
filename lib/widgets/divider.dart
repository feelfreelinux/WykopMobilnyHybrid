import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  final double height;
  final EdgeInsets padding;
  DividerWidget({
    this.height: 1.0,
    this.padding: const EdgeInsets.all(0.0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Divider(
        height: height,
      ),
    );
  }
}
