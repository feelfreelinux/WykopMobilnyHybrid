import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:provider/provider.dart';

class HighlightID {
  int id;
  HighlightID(this.id);
}

class HighlightWrapper extends StatelessWidget {
  final int id;
  final Widget child;
  HighlightWrapper({@required this.id, @required this.child});

  @override
  Widget build(BuildContext context) {
    return Provider<HighlightID>.value(
      value: HighlightID(this.id),
      child: child,
    );
  }
}

enum AuthorRelation {
  Author,
  User,
  Highlight,
  None,
}

enum RelationType {
  ENTRY_COMMENTS,
  ENTRY_COMMENTS_LIST,
  ENTRY,
  LINK_COMMENT,
  LINK_COMMENTS_LIST,
  LINK,
}

typedef Widget AuthorRelationWidgetBuilder(
    BuildContext context, AuthorRelation relation);

class AuthorRelationBuilder extends StatelessWidget {
  final AuthorRelationWidgetBuilder builder;
  final RelationType relationType;

  AuthorRelationBuilder({@required this.builder, @required this.relationType});

  @override
  Widget build(BuildContext context) {
    var authModel = Provider.of<AuthStateModel>(context, listen: false);

    var highlightId = Provider.of<HighlightID>(context, listen: false);

    switch (relationType) {
      case RelationType.ENTRY:
        var entryModel = Provider.of<EntryModel>(context, listen: false);
        if (highlightId != null && entryModel.id == highlightId.id) {
          return builder(context, AuthorRelation.Highlight);
        }

        if (authModel.loggedIn && entryModel.author.login == authModel.login) {
          return builder(context, AuthorRelation.User);
        }
        break;
      case RelationType.ENTRY_COMMENTS:
        var entryModel = Provider.of<EntryModel>(context, listen: false);
        var commentModel =
            Provider.of<EntryCommentModel>(context, listen: false);
        if (highlightId != null && commentModel.id == highlightId.id) {
          return builder(context, AuthorRelation.Highlight);
        }

        if (authModel.loggedIn &&
            commentModel.author.login == authModel.login) {
          return builder(context, AuthorRelation.User);
        } else if (entryModel.author.login == commentModel.author.login) {
          return builder(context, AuthorRelation.Author);
        }

        break;
      case RelationType.ENTRY_COMMENTS_LIST:
        var commentModel =
            Provider.of<EntryCommentModel>(context, listen: false);
        if (highlightId != null && commentModel.id == highlightId.id) {
          return builder(context, AuthorRelation.Highlight);
        }

        if (authModel.loggedIn &&
            commentModel.author.login == authModel.login) {
          return builder(context, AuthorRelation.User);
        }
        break;
      case RelationType.LINK_COMMENT:
        var linkModel = Provider.of<LinkModel>(context);
        var commentModel =
            Provider.of<LinkCommentModel>(context, listen: false);
        if (highlightId != null && commentModel.id == highlightId.id) {
          return builder(context, AuthorRelation.Highlight);
        }

        if (authModel.loggedIn &&
            commentModel.author.login == authModel.login) {
          return builder(context, AuthorRelation.User);
        } else if (linkModel.author.login == commentModel.author.login) {
          return builder(context, AuthorRelation.Author);
        }
        break;
      case RelationType.LINK_COMMENTS_LIST:
        var commentModel =
            Provider.of<LinkCommentModel>(context, listen: false);
        if (highlightId != null && commentModel.id == highlightId.id) {
          return builder(context, AuthorRelation.Highlight);
        }

        if (authModel.loggedIn &&
            commentModel.author.login == authModel.login) {
          return builder(context, AuthorRelation.User);
        }
        break;
      case RelationType.LINK:
        var linkModel = Provider.of<LinkModel>(context, listen: false);
        if (highlightId != null && linkModel.id == highlightId.id) {
          return builder(context, AuthorRelation.Highlight);
        }

        if (authModel.loggedIn && linkModel.author.login == authModel.login) {
          return builder(context, AuthorRelation.User);
        }
        break;
    }
    return builder(context, AuthorRelation.None);
  }
}
