import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:share/share.dart';
import 'package:owmflutter/model/model.dart';

class NewEntryFooterWidget extends StatelessWidget {
  final EntryModel entry;
  final bool isClickable;
  NewEntryFooterWidget(this.entry, this.isClickable);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FavoriteButton(
            isFavorite: false,
            onTap: () {},
          ),
          CommentsButton(
            count: entry.commentsCount,
            onTap: () {
              if (isClickable) {
                Navigator.push(
                  context,
                  Utils.getPageTransition(EntryScreen(model: entry)),
                );
              }
            },
          ),
          ShareButton(onTap: () {
            Share.share("https://www.wykop.pl/wpis/" + entry.id.toString());
          }),
        ],
      ),
    );
  }
}
