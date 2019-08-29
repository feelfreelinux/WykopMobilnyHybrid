import 'package:flutter/material.dart';

class TextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isButton;
  final EdgeInsets padding;

  TextButton({
    @required this.text,
    this.onTap,
    this.isButton: true,
    this.padding,
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
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          //TODO: tu powinien być Flexible żeby obcinało tekst ale nie działa
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: TextStyle(
              fontSize: 13.0,
              color: Theme.of(context).textTheme.caption.color,
              fontWeight: isButton ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
