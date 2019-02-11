import 'package:owmflutter/store/store.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';
import 'dart:async';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/models/models.dart';

class SetLinkComments implements TypedAction {
  final List<List<int>> ids;
  final String type;
  SetLinkComments({this.type, this.ids});
}

class SetRelatedLinks implements TypedAction {
  final List<int> ids;
  final String type;
  SetRelatedLinks({this.type, this.ids});
}

ThunkAction<AppState> loadLinkComments(int linkId, Completer completer) {
  return (Store<AppState> store) async {
    try {
      api.links.getLink(linkId).then((result) {
        store.dispatch(AddEntitiesAction(entities: result.state));
      });
      var result = await api.links.getLinkComments(linkId);

      store.dispatch(AddEntitiesAction(entities: result.state));
      var comments = result.result
          .map((e) => List<int>.from([e]
            ..addAll(store.state.entitiesState.linkComments[e].childrenIds)))
          .toList();

      store.dispatch(SetLinkComments(
          ids: comments, type: LINK_PREFIX + linkId.toString()));

      var relatedResult = await api.links.getRelatedLinks(linkId);
      store.dispatch(AddEntitiesAction(entities: relatedResult.state));
      store.dispatch(SetRelatedLinks(
          ids: relatedResult.result, type: LINK_PREFIX + linkId.toString()));

      completer.complete();
    } catch (e) {
      completer.completeError(e);
      store.dispatch(
          SetErrorAction(error: e, type: LINK_PREFIX + linkId.toString()));
    }
  };
}

ThunkAction<AppState> voteLinkComment(int id, bool downVote) {
  return (Store<AppState> store) async {
    var comment = store.state.entitiesState.linkComments[id];
    try {
      switch (comment.voteState) {
        case LinkCommentVoteState.UP_VOTED:
          {
            var result = await api.links.commentVoteRemove(comment);
            store.dispatch(AddEntitiesAction(entities: result.state));
            break;
          }
        case LinkCommentVoteState.DOWN_VOTED:
          {
            var result = await api.links.commentVoteRemove(comment);
            store.dispatch(AddEntitiesAction(entities: result.state));
            break;
          }
        case LinkCommentVoteState.NOT_VOTED:
          {
            if (downVote) {
              var result = await api.links.commentVoteDown(comment);
              store.dispatch(AddEntitiesAction(entities: result.state));
            } else {
              var result = await api.links.commentVoteUp(comment);
              store.dispatch(AddEntitiesAction(entities: result.state));
            }

            break;
          }
      }
    } catch (e) {
      throw (e);
      store.dispatch(SetErrorAction(error: e));
    }
  };
}
