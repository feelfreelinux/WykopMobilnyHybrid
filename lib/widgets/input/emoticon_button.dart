import 'package:flutter/material.dart';

class EmoticonButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  EmoticonButtonWidget({
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100.0),
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Icon(
          Icons.mood,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
