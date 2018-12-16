import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearching = false;
  String searchQuery = "";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
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
                      store.dispatch(searchLinks(q, true, completer));
                    },
                  )
                : AppbarTabsWidget(
                    onPressedSearch: () {
                      setState(() {
                        isSearching = true;
                      });
                    },
                    tabs: <Widget>[
                        Tab(text: 'GŁÓWNA'),
                        Tab(text: 'WYKOPALISKO'),
                        Tab(text: 'HITY')
                      ]),
            body: isSearching
                ? StoreConnector<AppState, ItemListState>(
                    onInit: (store) => store.dispatch(clearLinks()),
                    converter: (store) =>
                        store.state.searchState.linksSearchState,
                    builder: (context, state) =>
                        state.paginationState.itemIds.isNotEmpty
                            ? LinksList(
                                converterCallback: (store) =>
                                    store.state.searchState.linksSearchState,
                                loadDataCallback: (store, refresh, completer) =>
                                    store.dispatch(searchLinks(
                                        searchQuery, refresh, completer)))
                            : Center(child: Text('Wyszukaj najpierw')),
                  )
                : TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                        LinksList(
                            converterCallback: (store) =>
                                store.state.linksState.promotedState,
                            loadDataCallback: (store, refresh, completer) =>
                                store.dispatch(
                                    loadPromoted(refresh, completer))),
                        Text('todo xDDD'),
                        Text('todo xDDD')
                      ])));
  }
}
