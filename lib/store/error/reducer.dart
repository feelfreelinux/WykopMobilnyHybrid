import 'package:redux/redux.dart';
import 'package:owmflutter/store/store.dart';

ErrorState createErrorReducer(ErrorState state, String type, action) {
  if (action is TypedAction && action.type == type) {
    return combineReducers<ErrorState>(
      [
        TypedReducer<ErrorState, SetErrorAction>(_setError),
        TypedReducer<ErrorState, DismissErrorAction>(_dismissError),
      ],
    )(state, action);
  }
  return state;
}
Reducer<ErrorState> errorReducer = combineReducers<ErrorState>([
  TypedReducer<ErrorState, SetErrorAction>(_setError),
  TypedReducer<ErrorState, DismissErrorAction>(_dismissError),
]);

ErrorState _setError(ErrorState state, SetErrorAction action) {
  return state.rebuild((b) => b
    ..exception = action.error
    ..isDismissed = false);
}

ErrorState _dismissError(ErrorState state, DismissErrorAction action) {
  return state.rebuild((b) => b..isDismissed = true);
}
