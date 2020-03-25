import 'package:flutter/material.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:share/share.dart';
import 'package:owmflutter/model/model.dart';

class EntryFooterWidget extends StatelessWidget {
  final EntryModel entry;
  final bool isClickable;
  final AuthorRelation relation;

  EntryFooterWidget(this.entry, this.isClickable, this.relation);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FavoriteButton(
            isFavorite: entry.isFavorite,
            onTap: () => entry.favoriteToggle(),
          ),
          ShareButton(
            onTap: () =>
                Share.share("https://www.wykop.pl/wpis/" + entry.id.toString()),
          ),
          CommentsButton(
            count: entry.commentsCount,
            onLongPress: () => _showActionsDialog(context, entry, relation),
            onTap: () {
              if (isClickable)
                Navigator.push(
                    context, Utils.getPageSlideToUp(EntryScreen(model: entry)));
            },
          ),
        ],
      ),
    );
  }

  void _showActionsDialog(
      BuildContext contextmain, EntryModel entry, AuthorRelation relation) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: contextmain,
      builder: (BuildContext context) =>
          EntryBottomsheetWidget(contextmain, entry, relation),
    );
  }
}
