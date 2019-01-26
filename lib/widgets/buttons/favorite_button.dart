import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onClicked;
  FavoriteButton({@required this.isFavorite, @required this.onClicked});

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
                isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
                size: 20.0,
                color: Theme.of(context).textTheme.caption.color,
              ),
            ),
            Text(
              "Ulubione",
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
