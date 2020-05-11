import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class NoCommentsWidget extends StatelessWidget {
  final bool visible;

  NoCommentsWidget(this.visible);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Padding(
        padding: EdgeInsets.all(40.0),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.4), shape: BoxShape.circle),
              padding: EdgeInsets.all(14.0),
              child: Icon(
                CommunityMaterialIcons.comment_multiple_outline,
                size: 36.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Brak komentarzy",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text("Podziel się swoją opinią!"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
