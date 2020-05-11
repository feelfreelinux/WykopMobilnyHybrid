import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:share/share.dart';

class LinkFooterWidget extends StatelessWidget {
  final LinkModel model;
  final EdgeInsets padding;

  LinkFooterWidget({this.model, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.0,
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FavoriteButton(
            isFavorite: model.isFavorite,
            onTap: () => model.favoriteToggle(),
          ),
          ShareButton(
            onTap: () => Share.share(
                "${model.title}\r\nhttps://www.wykop.pl/link/${model.id}"),
          ),
          CommentsButton(
            count: model.commentsCount,
            onTap: () => Navigator.push(
              context,
              Utils.getPageSlideToUp(LinkScreen(model: model)),
            ),
          ),
        ],
      ),
    );
  }
}
