import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final bool onlyIcon;
  final VoidCallback onTap;

  FavoriteButton({
    @required this.isFavorite,
    this.onlyIcon: false,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: onlyIcon ? 0.0 : 6.0),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                size: 20.0,
                color: isFavorite
                    ? Colors.red
                    : Theme.of(context).textTheme.caption.color,
              ),
            ),
            Visibility(
              visible: !onlyIcon,
              child: Text(
                "Ulubione",
                style: TextStyle(
                  fontSize: 13.0,
                  color: Theme.of(context).textTheme.caption.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
