import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/models/models.dart';

final api = BaseWykopClient();

void appMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is LoadEntry) {
    api.getEntry(action.entryId).then((el) {
      store.dispatch(UpdateEntryAction(entry: Entry.mapFromResponse(el)));
    });
  }
  next(action);
}
