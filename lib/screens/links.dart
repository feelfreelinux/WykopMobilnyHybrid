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
      length: 4,
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
                  Tab(text: 'HITY'),
                  Tab(text: 'ULUBIONE'),
                ],
              ),
        body: isSearching
            ? StoreConnector<AppState, ItemListState>(
                onInit: (store) => store.dispatch(clearLinks()),
                converter: (store) => store.state.searchState.linksSearchState,
                builder: (context, state) => state
                        .paginationState.itemIds.isNotEmpty
                    ? LinksList(
                        converterCallback: (store) =>
                            store.state.searchState.linksSearchState,
                        loadDataCallback: (store, refresh, completer) =>
                            store.dispatch(
                                searchLinks(searchQuery, refresh, completer)))
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
                            Text('Szukaj znaleziska'),
                          ],
                        ),
                      ),
              )
            : TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  LinksList(
                      converterCallback: (store) =>
                          store.state.linksState.promotedState,
                      loadDataCallback: (store, refresh, completer) =>
                          store.dispatch(loadPromoted(refresh, completer))),
                  Center(
                    child: Text('Niezaimplementowane'),
                  ),
                  Center(
                    child: Text('Niezaimplementowane'),
                  ),
                  NotLoggedWidget(
                    icon: Icons.favorite,
                    text: "Ulubione znaleziska",
                    child: Center(
                      child: LinksList(
                          converterCallback: (store) =>
                              store.state.linksState.favoriteState,
                          loadDataCallback: (store, refresh, completer) => store
                              .dispatch(loadLinksFavorite(refresh, completer))),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
