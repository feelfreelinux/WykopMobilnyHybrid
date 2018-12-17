import 'package:owmflutter/store/store.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';
import 'dart:async';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/models/models.dart';

class SetEntryAction {
  final List<int> ids;
  final String screenId;
  SetEntryAction({this.screenId, this.ids});
}

ThunkAction<AppState> loadEntry(
    String screenId, int entryId, Completer completer) {
  return (Store<AppState> store) async {
    try {
      var result = await api.entries.getEntry(entryId);

      store.dispatch(AddEntitiesAction(entities: result.state));
      store.dispatch(SetEntryAction(ids: result.result, screenId: screenId));
      completer.complete();
    } catch (e) {
      completer.completeError(e);
    }
  };
}

ThunkAction<AppState> voteEntry(int id) {
  return (Store<AppState> store) async {
    var entry = store.state.entitiesState.entries[id];
    if (entry.isVoted) {
      var result = await api.entries.voteDown(entry);
      store.dispatch(AddEntitiesAction(entities: result.state));
    } else {
      var result = await api.entries.voteUp(entry);
      store.dispatch(AddEntitiesAction(entities: result.state));
    }
  };
}

ThunkAction<AppState> voteEntryComment(int id) {
  return (Store<AppState> store) async {
    var entry = store.state.entitiesState.entryComments[id];
    if (entry.isVoted) {
      var result = await api.entries.commentVoteDown(entry);
      store.dispatch(AddEntitiesAction(entities: result.state));
    } else {
      var result = await api.entries.commentVoteUp(entry);
      store.dispatch(AddEntitiesAction(entities: result.state));
    }
  };
}

ThunkAction<AppState> addEntryComment(
    int id, InputData inputData, Completer completer) {
  return (Store<AppState> store) async {
    var entry = store.state.entitiesState.entries[id];
    await api.entries.addEntryComment(entry, inputData);
    var entryCompltr = Completer();
    store.dispatch(loadEntry(id.toString(), id, entryCompltr));
    await entryCompltr.future;
    completer.complete();
  };
}
