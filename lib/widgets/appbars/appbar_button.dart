import 'package:flutter/material.dart';
import 'package:owmflutter/utils/utils.dart';

class AppBarButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final EdgeInsets iconPadding;
  final EdgeInsets buttonMargin;
  final bool round;
  final Color roundColor;
  final VoidCallback onTap;

  AppBarButton({
    @required this.icon,
    this.iconSize: 24.0,
    this.iconColor,
    this.iconPadding,
    this.buttonMargin: const EdgeInsets.symmetric(horizontal: 8.0),
    this.round: false,
    this.roundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: buttonMargin,
          padding: round
              ? iconPadding ?? EdgeInsets.all(6.0)
              : iconPadding ?? EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: round
                ? roundColor ?? Utils.backgroundGreyOpacity(context)
                : Theme.of(context).primaryColor,
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
