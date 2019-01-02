import 'package:flutter/material.dart';

class MediaButtonWidget extends StatelessWidget {
  final bool show;
  final VoidCallback onTap;
  MediaButtonWidget({
    @required this.show,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (show) {
      return Container(
        padding: EdgeInsets.only(bottom: 6.0),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(100.0),
          child: Padding(
            padding: EdgeInsets.all(6.0),
            child: Icon(
              Icons.image,
              size: 26.0,
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
