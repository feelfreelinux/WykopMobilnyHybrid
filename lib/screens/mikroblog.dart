import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';

class MikroblogScreen extends StatefulWidget {
  _MikroblogScreenState createState() => _MikroblogScreenState();
}

class _MikroblogScreenState extends State<MikroblogScreen> {
  bool isSearching = false;
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: isSearching
            ? SearchAppbarWidget(
                onClosedSearch: () {
                  setState(() {
                    isSearching = false;
                    searchQuery = "";
                  });
                },
                searchCallback: (q, store, completer) {
                  setState(() {
                    searchQuery = q;
                  });
                  store.dispatch(searchEntries(q, true, completer));
                },
              )
            : AppbarTabsWidget(
                tabs: <Widget>[
                  Tab(text: 'NOWE'),
                  Tab(text: 'AKTYWNE'),
                  Tab(text: 'GORĄCE 6H'),
                  Tab(text: 'GORĄCE 12H'),
                  Tab(text: 'GORĄCE 24H'),
                  Tab(text: 'ULUBIONE'),
                ],
                onPressedSearch: () {
                  setState(() {
                    isSearching = true;
                  });
                },
              ),
        body: isSearching
            ? StoreConnector<AppState, ItemListState>(
                onInit: (store) => store.dispatch(clearEntries()),
                converter: (store) =>
                    store.state.searchState.entriesSearchState,
                builder: (context, state) => state
                        .paginationState.itemIds.isNotEmpty
                    ? EntryList(
                        converterCallback: (store) =>
                            store.state.searchState.entriesSearchState,
                        loadDataCallback: (store, refresh, completer) =>
                            store.dispatch(
                                searchEntries(searchQuery, refresh, completer)))
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Icon(
                                Icons.search,
                                size: 60.0,
                              ),
                            ),
                            Text('Szukaj wpisu'),
                          ],
                        ),
                      ),
              )
            : TabBarView(
                children: [
                  EntryList(
                      actionType: MIKROBLOG_NEWEST,
                      converterCallback: (store) =>
                          store.state.mikroblogState.newestState,
                      loadDataCallback: (store, refresh, completer) =>
                          store.dispatch(loadNewest(refresh, completer))),
                  EntryList(
                      actionType: MIKROBLOG_ACTIVE,
                      converterCallback: (store) =>
                          store.state.mikroblogState.activeState,
                      loadDataCallback: (store, refresh, completer) =>
                          store.dispatch(loadActive(refresh, completer))),
                  EntryList(
                      actionType: MIKROBLOG_HOT6,
                      converterCallback: (store) =>
                          store.state.mikroblogState.hot6State,
                      loadDataCallback: (store, refresh, completer) =>
                          store.dispatch(loadHot6(refresh, completer))),
                  EntryList(
                      actionType: MIKROBLOG_HOT12,
                      converterCallback: (store) =>
                          store.state.mikroblogState.hot12State,
                      loadDataCallback: (store, refresh, completer) =>
                          store.dispatch(loadHot12(refresh, completer))),
                  EntryList(
                      actionType: MIKROBLOG_HOT24,
                      converterCallback: (store) =>
                          store.state.mikroblogState.hot24State,
                      loadDataCallback: (store, refresh, completer) =>
                          store.dispatch(loadHot24(refresh, completer))),
                  NotLoggedWidget(
                    icon: Icons.favorite,
                    text: "Ulubione wpisy",
                    child: Center(
                      child: EntryList(
                          actionType: MIKROBLOG_FAVORITE,
                          converterCallback: (store) =>
                              store.state.mikroblogState.favoriteState,
                          loadDataCallback: (store, refresh, completer) =>
                              store.dispatch(
                                  loadEntriesFavorite(refresh, completer))),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
