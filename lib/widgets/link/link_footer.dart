import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:share/share.dart';

class LinkFooterWidget extends StatelessWidget {
  final LinkModel link;
  final bool isClickable;

  LinkFooterWidget({this.link, this.isClickable});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FavoriteButton(
            isFavorite: link.isFavorite,
            onTap: () => link.favoriteToggle(),
          ),
          CommentsButton(
            count: link.commentsCount,
            onTap: () {
              if (isClickable) {
                Navigator.push(
                  context,
                  Utils.getPageTransition(LinkScreen(model: link)),
                );
              }
            },
          ),
          ShareButton(
            onTap: () => Share.share(link.title +
                "\nhttps://www.wykop.pl/link/" +
                link.id.toString()),
          ),
        ],
      ),
    );
  }
}
