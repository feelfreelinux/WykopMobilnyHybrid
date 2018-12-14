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
                      Tab(text: 'GORĄCE 24H')
                    ],
                  onPressedSearch: () {
                    setState(() {
                      isSearching = true;
                    });
                  }),
          body: isSearching
              ? StoreConnector<AppState, ItemListState>(
                  onInit: (store) => store.dispatch(clearEntries()),
                  converter: (store) =>
                      store.state.searchState.entriesSearchState,
                  builder: (context, state) =>
                      state.paginationState.itemIds.isNotEmpty
                          ? EntryList(
                              converterCallback: (store) =>
                                  store.state.searchState.entriesSearchState,
                              loadDataCallback: (store, refresh, completer) =>
                                  store.dispatch(searchEntries(
                                      searchQuery, refresh, completer)))
                          : Center(child: Text('Wyszukaj najpierw')),
                )
              : TabBarView(children: [
                  EntryList(
                      converterCallback: (store) =>
                          store.state.mikroblogState.newestState,
                      loadDataCallback: (store, refresh, completer) =>
                          store.dispatch(loadNewest(refresh, completer))),
                  EntryList(
                      converterCallback: (store) =>
                          store.state.mikroblogState.activeState,
                      loadDataCallback: (store, refresh, completer) =>
                          store.dispatch(loadActive(refresh, completer))),
                  EntryList(
                      converterCallback: (store) =>
                          store.state.mikroblogState.hot6State,
                      loadDataCallback: (store, refresh, completer) =>
                          store.dispatch(loadHot6(refresh, completer))),
                  EntryList(
                      converterCallback: (store) =>
                          store.state.mikroblogState.hot12State,
                      loadDataCallback: (store, refresh, completer) =>
                          store.dispatch(loadHot12(refresh, completer))),
                  EntryList(
                      converterCallback: (store) =>
                          store.state.mikroblogState.hot24State,
                      loadDataCallback: (store, refresh, completer) =>
                          store.dispatch(loadHot24(refresh, completer)))
                ], physics: NeverScrollableScrollPhysics()),
        ));
  }
}
