import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/screens/screens.dart';

class EntryFooterWidget extends StatelessWidget {
  final Entry entry;
  final bool isClickable;
  EntryFooterWidget(this.entry, this.isClickable);

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
                  Utils.getPageTransition(
                    EntryScreen(
                      entryId: entry.id,
                    ),
                  ),
                );
              }
            },
          ),
          ShareButton(onTap: () {}),
        ],
      ),
    );
  }
}
