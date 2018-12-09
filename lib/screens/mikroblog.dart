import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/keys.dart';

class _SearchDemoSearchDelegate extends SearchDelegate<int> {
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Powrót',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  @override
  Widget buildResults(BuildContext context) {
    return EntryList(
        converterCallback: (store) => store.state.mikroblogState.activeState,
        loadDataCallback: (store, refresh, completer) =>
            store.dispatch(loadActive(refresh, completer)));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      query.isEmpty
          ? IconButton(
              tooltip: 'Voice Search',
              icon: const Icon(Icons.mic),
              onPressed: () {
                query = 'TODO: implement voice input';
              },
            )
          : IconButton(
              tooltip: 'Clear',
              icon: const Icon(Icons.clear),
              onPressed: () {
                query = '';
                showSuggestions(context);
              },
            )
    ];
  }
}

class MikroblogScreen extends StatelessWidget {
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
                onSearch: (q) {
                  showSearchResultsBottomSheet(
                      context,
                      EntryList(
                          converterCallback: (store) =>
                              store.state.mikroblogState.activeState,
                          loadDataCallback: (store, refresh, completer) =>
                              store.dispatch(loadActive(refresh, completer))));
                }),
            body: TabBarView(children: [
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
            ], physics: NeverScrollableScrollPhysics())));
  }
}
