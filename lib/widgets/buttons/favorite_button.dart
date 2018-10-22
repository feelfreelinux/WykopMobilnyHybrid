import 'package:flutter/material.dart';
import 'package:owmflutter/owm_glyphs.dart';

class FavoriteButton extends StatelessWidget {
  final VoidCallback onClicked;

  FavoriteButton({@required this.onClicked});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(OwmGlyphs.ic_buttontoolbar_favorite,
                  size: 19.0, color: Theme.of(context).textTheme.caption.color),
            ],
          )),
      onTap: this.onClicked,
    );
  }
}
