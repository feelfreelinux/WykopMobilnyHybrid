import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:owmflutter/api/api.dart';

class SetErrorAction implements TypedAction {
  final Exception error;
  final String type;
  SetErrorAction({this.error, this.type});
}

class DismissErrorAction implements TypedAction {
  final String type;
  DismissErrorAction({this.type});
}
