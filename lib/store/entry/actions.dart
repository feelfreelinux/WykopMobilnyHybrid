import 'package:owmflutter/store/store.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';
import 'dart:async';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/models/models.dart';

class SetEntryAction implements TypedAction {
  final List<int> ids;
  final String type;
  SetEntryAction({this.type, this.ids});
}

ThunkAction<AppState> loadEntry(
    String screenId, int entryId, Completer completer) {
  return (Store<AppState> store) async {
    try {
      var result = await api.entries.getEntry(entryId);

      store.dispatch(AddEntitiesAction(entities: result.state));
      store.dispatch(
          SetEntryAction(ids: result.result, type: ENTRY_PREFIX + screenId));
      completer.complete();
    } catch (e) {
      store.dispatch(SetErrorAction(error: e, type: ENTRY_PREFIX + screenId));
      completer.completeError(e);
    }
  };
}

ThunkAction<AppState> deleteEntry(int entryId, Completer completer) {
  return (Store<AppState> store) async {
    store.dispatch(DismissErrorAction(type: ENTRY_PREFIX + entryId.toString()));
    try {
      var result = await api.entries.deleteEntry(entryId);

      store.dispatch(AddEntitiesAction(entities: result.state));
      completer.complete();
    } catch (e) {
      store.dispatch(
          SetErrorAction(error: e, type: ENTRY_PREFIX + entryId.toString()));
      completer.completeError(e);
    }
  };
}

ThunkAction<AppState> deleteEntryComment(int commentId, Completer completer) {
  return (Store<AppState> store) async {
    store.dispatch(DismissErrorAction());

    try {
      var result = await api.entries.deleteEntryComment(commentId);
      store.dispatch(AddEntitiesAction(entities: result.state));
      completer.complete();
    } catch (e) {
      store.dispatch(SetErrorAction(error: e));
      completer.completeError(e);
    }
  };
}

ThunkAction<AppState> voteEntry(int id) {
  return (Store<AppState> store) async {
    store.dispatch(DismissErrorAction(type: ENTRY_PREFIX + id.toString()));
    var entry = store.state.entitiesState.entries[id];
    try {
      if (entry.isVoted) {
        var result = await api.entries.voteDown(entry);
        store.dispatch(AddEntitiesAction(entities: result.state));
      } else {
        var result = await api.entries.voteUp(entry);
        store.dispatch(AddEntitiesAction(entities: result.state));
      }
    } catch (e) {
      store.dispatch(SetErrorAction(error: e, type: ENTRY_PREFIX + id.toString()));
    }
  };
}

ThunkAction<AppState> voteEntryComment(int id) {
  return (Store<AppState> store) async {
    var entry = store.state.entitiesState.entryComments[id];
    try {
      if (entry.isVoted) {
        var result = await api.entries.commentVoteDown(entry);
        store.dispatch(AddEntitiesAction(entities: result.state));
      } else {
        var result = await api.entries.commentVoteUp(entry);
        store.dispatch(AddEntitiesAction(entities: result.state));
      }
    } catch (e) {
      store.dispatch(SetErrorAction(error: e));
    }
  };
}

ThunkAction<AppState> addEntryComment(
    int id, InputData inputData, Completer completer) {
  return (Store<AppState> store) async {
    store.dispatch(DismissErrorAction(type: ENTRY_PREFIX + id.toString()));
    var entry = store.state.entitiesState.entries[id];

    try {
      await api.entries.addEntryComment(entry, inputData);
      var entryCompltr = Completer();
      store.dispatch(loadEntry(id.toString(), id, entryCompltr));
      await entryCompltr.future;
      completer.complete();
    } catch (e) {
      store.dispatch(SetErrorAction(error: e, type: ENTRY_PREFIX + id.toString()));
    }
  };
}
