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
                  Padding(
                    padding: EdgeInsets.only(right: 2.0, top: 1.0),
                    child: Icon(OwmGlyphs.ic_buttontoolbar_favorite,
                        size: 17.0,
                        color: Theme.of(context).textTheme.caption.color),
                  ),
                  Text(" ulubiony",
                      style: TextStyle(
                          fontSize: 13.5,
                          color: Theme.of(context).textTheme.caption.color))
                ])),
        onTap: this.onClicked);
  }
}
