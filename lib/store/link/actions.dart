import 'package:owmflutter/store/store.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';
import 'dart:async';
import 'package:owmflutter/api/api.dart';

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
      print(relatedResult);
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
