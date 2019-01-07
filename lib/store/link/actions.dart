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

ThunkAction<AppState> loadLinkComments(int linkId, Completer completer) {
  return (Store<AppState> store) async {
    try {
      var result = await api.links.getLinkComments(linkId);

      store.dispatch(AddEntitiesAction(entities: result.state));
      var comments = result.result
          .map((e) => List<int>.from([e]
            ..addAll(store.state.entitiesState.linkComments[e].childrenIds)))
          .toList();

      store.dispatch(SetLinkComments(
          ids: comments, type: LINK_PREFIX + linkId.toString()));
      completer.complete();
    } catch (e) {
      completer.completeError(e);
      store.dispatch(
          SetErrorAction(error: e, type: LINK_PREFIX + linkId.toString()));
    }
  };
}
