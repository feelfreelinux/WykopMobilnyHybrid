import 'package:redux/redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/api/api.dart';

final api = BaseWykopClient();

void appMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is LoadHotAction) {
    api.getHot().then((el) {
      store.dispatch(SetEntriesAction(entries: el));
    });
  }
  next(action);
}
