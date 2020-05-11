import 'package:flutter/material.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:share/share.dart';
import 'package:owmflutter/model/model.dart';

class EntryFooterWidget extends StatelessWidget {
  final EntryModel model;
  final bool isClickable;
  final AuthStateModel authStateModel;
  final AuthorRelation relation;
  final EdgeInsets padding;

  EntryFooterWidget({
    @required this.model,
    @required this.isClickable,
    @required this.authStateModel,
    @required this.relation,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.0,
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FavoriteButton(
            isFavorite: model.isFavorite,
            onTap: () => model.favoriteToggle(),
          ),
          ShareButton(
            onTap: () =>
                Share.share("https://www.wykop.pl/wpis/" + model.id.toString()),
          ),
          CommentsButton(
            count: model.commentsCount,
            onLongPress: () =>
                _showActionsDialog(context, model, authStateModel, relation),
            onTap: () {
              if (isClickable)
                Navigator.push(
                    context, Utils.getPageSlideToUp(EntryScreen(model: model)));
            },
          ),
        ],
      ),
    );
  }

  void _showActionsDialog(BuildContext contextmain, EntryModel model,
      AuthStateModel authStateModel, AuthorRelation relation) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: contextmain,
      builder: (BuildContext context) =>
          EntryToolbarWidget(contextmain, model, authStateModel, relation),
    );
  }
}
