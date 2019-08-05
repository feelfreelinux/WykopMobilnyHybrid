import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  final VoidCallback onTap;

  ShareButton({@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 4.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 6.0),
              child: Icon(
                Icons.share,
                size: 18.0,
                color: Theme.of(context).textTheme.caption.color,
              ),
            ),
            Text(
              "Udostępnij",
              style: TextStyle(
                fontSize: 14.0,
                color: Theme.of(context).textTheme.caption.color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
