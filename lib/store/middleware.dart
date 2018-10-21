import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/models/models.dart';

final api = BaseWykopClient();

void appMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is LoadHotAction) {
    api.getHot().then((el) {
      store.dispatch(SetEntriesAction(entries: BuiltList.from(el.map((el) { return Entry.mapFromResponse(el); }).toList())));
    });
  }
  next(action);
}
