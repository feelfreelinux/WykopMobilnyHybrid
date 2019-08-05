import 'package:flutter/material.dart';
import 'package:owmflutter/utils/utils.dart';

class RoundIconButtonWidget extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final EdgeInsets iconPadding;
  final EdgeInsets padding;
  final Color roundColor;
  final VoidCallback onTap;

  RoundIconButtonWidget({
    @required this.icon,
    this.iconSize: 24.0,
    this.iconColor,
    this.iconPadding,
    this.padding,
    this.roundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(100),
        child: Container(
          padding: iconPadding ?? EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            color: roundColor ?? Utils.backgroundGreyOpacity(context),
            shape: BoxShape.circle,
          ),
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
