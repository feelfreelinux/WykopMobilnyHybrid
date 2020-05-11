import 'package:flutter/material.dart';
import 'package:owmflutter/utils/utils.dart';

class TextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isButton;
  final EdgeInsets padding;
  final double textSize;
  final Widget child;

  TextButton({
    @required this.text,
    this.onTap,
    this.isButton: true,
    this.padding,
    this.textSize = 12.0,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: InkWell(
        focusColor: !isButton ? Colors.transparent : null,
        hoverColor: !isButton ? Colors.transparent : null,
        splashColor: !isButton ? Colors.transparent : null,
        highlightColor: !isButton ? Colors.transparent : null,
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: isButton
              ? EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0)
              : null,
          decoration: isButton
              ? BoxDecoration(
                  color: Utils.backgroundGrey(context),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Theme.of(context).backgroundColor,
                    width: 2.0,
                  ),
                )
              : null,
          child: child == null
              ? Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: TextStyle(
                    fontSize: textSize,
                    color: Theme.of(context).textTheme.caption.color,
                    fontWeight: isButton ? FontWeight.w500 : FontWeight.normal,
                  ),
                )
              : child,
        ),
      ),
    );
  }
}
