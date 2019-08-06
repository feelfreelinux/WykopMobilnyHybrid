import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onTap;

  FavoriteButton({@required this.isFavorite, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 4.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 6.0),
              child: AnimatedCrossFade(
                duration: Duration(milliseconds: 300),
                firstChild: Icon(
                  Icons.favorite,
                  size: 20.0,
                  color: Colors.red,
                ),
                secondChild: Icon(
                  Icons.favorite_border,
                  size: 20.0,
                  color: Theme.of(context).textTheme.caption.color,
                ),
                crossFadeState: isFavorite
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
            ),
            Text(
              "Ulubione",
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
