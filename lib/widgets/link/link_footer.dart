import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/utils/utils.dart';

class LinkFooterWidget extends StatelessWidget {
  final Link link;
  final bool isClickable;
  LinkFooterWidget(this.link, this.isClickable);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FavoriteButton(
            isFavorite: false,
            onClicked: () {},
          ),
          CommentsButton(
            count: link.commentsCount,
            onClicked: () {
              if (isClickable) {
                Navigator.of(context).push(
                  Utils.getPageTransition(
                    LinkScreen(
                      linkId: link.id,
                    ),
                  ),
                );
              }
            },
          ),
          ShareButton(onClicked: () {}),
        ],
      ),
    );
  }
}
