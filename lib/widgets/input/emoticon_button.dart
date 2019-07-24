import 'package:flutter/material.dart';

class EmoticonButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final Color iconColor;
  EmoticonButtonWidget({
    @required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100.0),
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Icon(
          Icons.mood,
          color: iconColor ?? Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
