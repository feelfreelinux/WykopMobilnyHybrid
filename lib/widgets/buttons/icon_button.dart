import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final EdgeInsets iconPadding;
  final EdgeInsets padding;
  final VoidCallback onTap;

  IconButtonWidget({
    @required this.icon,
    this.iconSize: 30.0,
    this.iconColor,
    this.iconPadding,
    this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(6.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(100),
        child: Padding(
          padding: iconPadding ?? EdgeInsets.all(6.0),
          child: Icon(
            icon,
            size: iconSize,
            color: iconColor ?? Theme.of(context).iconTheme.color,
          ),
        ),
      ),
    );
  }
}
