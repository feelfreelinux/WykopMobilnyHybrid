import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onTap;

  FavoriteButton({@required this.isFavorite, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: AnimatedCrossFade(
          duration: Duration(milliseconds: 300),
          firstChild: Icon(
            CommunityMaterialIcons.heart,
            size: 22.0,
            color: Colors.red,
          ),
          secondChild: Icon(
            CommunityMaterialIcons.heart_outline,
            size: 22.0,
            color: Theme.of(context).textTheme.caption.color,
          ),
          crossFadeState:
              isFavorite ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
      ),
    );
  }
}
