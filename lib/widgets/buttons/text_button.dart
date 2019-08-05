import 'package:flutter/material.dart';

class TextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isButton;
  final EdgeInsets padding;

  TextButton(
      {@required this.text, this.onTap, this.isButton: true, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
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
