import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/keys.dart';
import 'package:flutter_redux/flutter_redux.dart';

class MikroblogScreen extends StatefulWidget {
  _MikroblogScreenState createState() => _MikroblogScreenState();
}

class _MikroblogScreenState extends State<MikroblogScreen> {
  bool showingResults = false;
  bool hasData = false;
  String searchQuery = "";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppbarTabsWidget(
              tabs: <Widget>[
                Tab(text: 'NOWE'),
                Tab(text: 'AKTYWNE'),
                Tab(text: 'GORĄCE 6H'),
                Tab(text: 'GORĄCE 12H'),
                Tab(text: 'GORĄCE 24H')
              ],
              closeCallback: () {
                setState(() {
                  showingResults = false;
                  hasData = false;
                });
              },
              openCallback: () {
                setState(() {
                  showingResults = true;
                });
              },
              onSearch: (q) {
                setState(() {
                  searchQuery = q;
                  hasData = true;
                  showingResults = true;
                });
              }),
          body: showingResults
              ? StoreConnector<AppState, VoidCallback>(
                  converter: (store) => () {},
                  onInit: (store) => store.dispatch(clearEntries()),
                  builder: (context, callback) => hasData
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
