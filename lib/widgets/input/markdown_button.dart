import 'package:flutter/material.dart';

class MarkdownButtonWidget extends StatelessWidget {
  final bool show;
  final VoidCallback onTap;
  final Color iconColor;
  MarkdownButtonWidget({
    @required this.show,
    @required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 6.0,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(100.0),
        child: Padding(
          padding: EdgeInsets.all(6.0),
          child: Icon(
            show ? Icons.remove_circle : Icons.add_circle,
            size: 28.0,
            color: iconColor ?? Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
