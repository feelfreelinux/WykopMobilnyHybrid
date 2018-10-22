import 'package:owmflutter/models/models.dart';
import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/store/store.dart';

Reducer<MikroblogState> mikroblogReducer = combineReducers<MikroblogState>(
    [TypedReducer<MikroblogState, SetEntriesAction>(_setEntriesAction),
    TypedReducer<MikroblogState, SetLoading>(_setLoading),
    TypedReducer<MikroblogState, SetPageNumber>(_setPageNumber),
    TypedReducer<MikroblogState, AddEntriesAction>(_addEntriesAction)],);
    

MikroblogState _setEntriesAction(
    MikroblogState state, SetEntriesAction action) {
  return state.rebuild((b) => b..entries.replace(action.entries));
}

MikroblogState _setLoading(
    MikroblogState state, SetLoading action) {
  return state.rebuild((b) => b.isLoading = action.isLoading);
}

MikroblogState _setPageNumber(
    MikroblogState state, SetPageNumber action) {
  return state.rebuild((b) => b.page = action.number);
}

MikroblogState _addEntriesAction(
    MikroblogState state, AddEntriesAction action) {
  return state.rebuild((b) => b..entries.addAll(action.entries));
}