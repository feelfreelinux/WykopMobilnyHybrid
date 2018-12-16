import 'package:redux/redux.dart';
import 'package:owmflutter/store/store.dart';

Reducer<LinkScreensState> linkScreenReducer = combineReducers([
  TypedReducer<LinkScreensState, SetLinkComments>(_setLinkComments),
]);

LinkScreensState _setLinkComments(LinkScreensState state, SetLinkComments action) {
  return state.rebuild((b) => b
    ..states.putIfAbsent(action.linkId, () => LinkScreenState())
    ..states.updateValue(
        action.linkId,
        (b) => b
          ..ids.clear()
          ..ids.addAll(action.ids)));
}
