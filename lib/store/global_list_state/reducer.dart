import 'package:redux/redux.dart';
import 'package:owmflutter/store/list/actions.dart';
import 'package:owmflutter/store/store.dart';

Reducer<GlobalListState> globalListStateReducer = combineReducers<GlobalListState>([
  TypedReducer<GlobalListState, SetShowShadow>(_setShowShadow),
  TypedReducer<GlobalListState, SetShowInputShadow>(_setShowInputShadow),
]);

GlobalListState _setShowShadow(
    GlobalListState state, SetShowShadow action) {
  return state.rebuild((b) => b
    ..showListShadow = action.showShadow);
}

GlobalListState _setShowInputShadow(
    GlobalListState state, SetShowInputShadow action) {
  return state.rebuild((b) => b
    ..showInputShadow = action.showShadow);
}