import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  final bool onlyIcon;
  final VoidCallback onTap;

  ShareButton({
    this.onlyIcon: false,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: onlyIcon ? 0.0 : 6.0),
              child: Icon(
                Icons.share,
                size: 18.0,
                color: Theme.of(context).textTheme.caption.color,
              ),
            ),
            Visibility(
              visible: !onlyIcon,
              child: Text(
                "Udostępnij",
                style: TextStyle(
                  fontSize: 13.0,
                  color: Theme.of(context).textTheme.caption.color,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
