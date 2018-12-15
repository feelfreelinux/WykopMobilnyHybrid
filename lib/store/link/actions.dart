import 'package:owmflutter/store/store.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';
import 'dart:async';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/models/models.dart';

class SetLinkComments {
  final List<int> ids;
  final int linkId;
  SetLinkComments({this.linkId, this.ids});
}

ThunkAction<AppState> loadLinkComments(int linkId, Completer completer) {
  return (Store<AppState> store) async {
    try {
      var result = await api.links.getLinkComments(linkId);

      store.dispatch(AddEntitiesAction(entities: result.state));
      store.dispatch(SetLinkComments(ids: result.result, linkId: linkId));
      completer.complete();
    } catch (e) {
      completer.completeError(e);
    }
  };
}