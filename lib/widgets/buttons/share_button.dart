import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  final VoidCallback onClicked;
  ShareButton({@required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 4.0,
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                right: 6.0,
              ),
              child: Icon(
                Icons.share,
                size: 18.0,
                color: Theme.of(context).textTheme.caption.color,
              ),
            ),
            Text(
              "udostępnij",
              style: TextStyle(
                fontSize: 13.0,
                color: Theme.of(context).textTheme.caption.color,
              ),
            ),
          ],
        ),
      ),
      onTap: this.onClicked,
    );
  }
}
