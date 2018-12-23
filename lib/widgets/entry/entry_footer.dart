import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/screens/screens.dart';

class EntryFooterWidget extends StatelessWidget {
  final Entry entry;
  EntryFooterWidget(this.entry);

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
            count: entry.commentsCount,
            onClicked: () {
              Navigator.of(context).push(
                Utils.getPageTransition(
                  EntryScreen(
                    entryId: entry.id,
                  ),
                ),
              );
            },
          ),
          ShareButton(onClicked: () {}),
        ],
      ),
    );
  }
}
