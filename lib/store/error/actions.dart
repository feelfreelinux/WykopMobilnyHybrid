import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:owmflutter/api/api.dart';

class SetErrorAction {
  final Exception error;
  SetErrorAction({this.error});
}

class DismissErrorAction {
  DismissErrorAction();
}