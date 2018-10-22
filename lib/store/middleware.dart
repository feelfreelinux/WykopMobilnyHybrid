import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/models/models.dart';

final api = BaseWykopClient();

void appMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is LoadHotAction) {
    store.dispatch(SetLoading(isLoading: true));
    api.getHot(store.state.mikroblogState.page).then((el) {
      store
          .dispatch(SetPageNumber(number: store.state.mikroblogState.page + 1));
      store.dispatch(SetLoading(isLoading: false));

      if (store.state.mikroblogState.page == 2) {
        store.dispatch(SetEntriesAction(
            entries: BuiltList.from(el.map((el) {
          return Entry.mapFromResponse(el);
        }).toList())));
      } else {
        store.dispatch(AddEntriesAction(
            entries: BuiltList.from(el.map((el) {
          return Entry.mapFromResponse(el);
        }).toList())));
      }
    });
  }
  next(action);
}
