import 'package:flutter/material.dart';

class MarkdownButtonWidget extends StatelessWidget {
  final bool show;
  final VoidCallback onTap;
  MarkdownButtonWidget({
    @required this.show,
    @required this.onTap,
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
            size: 26.0,
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
