import 'package:flutter/material.dart';

class MediaButtonWidget extends StatelessWidget {
  final bool show;
  final VoidCallback onTap;
  final Color iconColor;

  MediaButtonWidget({
    @required this.show,
    @required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: show,
      child: Container(
        padding: EdgeInsets.only(bottom: 6.0),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(100.0),
          child: Padding(
            padding: EdgeInsets.all(6.0),
            child: Icon(
              Icons.image,
              size: 28.0,
              color: iconColor ?? Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
