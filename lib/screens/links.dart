import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/screens/screens.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearching = false;
  String searchQuery = "";

  Widget topIcon(String title, String tag, IconData icon) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, Utils.getPageTransition(TagScreen(tag: tag)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 9.0,
        ),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Utils.backgroundGreyOpacity(context),
                shape: BoxShape.circle,
              ),
              margin: EdgeInsets.only(
                left: 4.0,
                top: 2.0,
                right: 4.0,
                bottom: 6.0,
              ),
              padding: EdgeInsets.all(12.0),
              child: Icon(icon),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 11.0,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }

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
                  Tab(text: 'Główna'),
                  Tab(text: 'Wykopalisko'),
                  Tab(text: 'Hity'),
                  Tab(text: 'Ulubione'),
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
                children: [
                  LinksList(
                    header: Column(
                      children: <Widget>[
                        SingleChildScrollView(
                            padding: EdgeInsets.symmetric(
                              horizontal: 9.0,
                            ),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                topIcon("Ciekawostki", "ciekawostki",
                                    Icons.lightbulb_outline),
                                topIcon("Nauka", "nauka", Icons.school),
                                topIcon("Historia", "historia",
                                    Icons.calendar_today),
                                topIcon("Rozrywka", "rozrywka",
                                    Icons.videogame_asset),
                                topIcon("Sport", "sport", Icons.rowing),
                                topIcon("Motoryzacja", "motoryzacja",
                                    Icons.motorcycle),
                                topIcon("Syria", "syria", Icons.place),
                                topIcon("Świat", "swiat", Icons.public),
                                topIcon("SpaceX", "spacex", Icons.whatshot),
                                topIcon("Programowanie", "programowanie",
                                    Icons.code),
                                topIcon("Technologia", "technologia",
                                    Icons.wifi_tethering),
                                topIcon("AMA", "ama", Icons.question_answer),
                              ],
                            )),
                        DividerWidget(
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.0,
                          ),
                        ),
                      ],
                    ),
                    converterCallback: (store) =>
                        store.state.linksState.promotedState,
                    loadDataCallback: (store, refresh, completer) =>
                        store.dispatch(loadPromoted(refresh, completer)),
                  ),
                  Center(
                    child: Text('Niezaimplementowane'),
                  ),
                  Center(
                    child: Text('Niezaimplementowane'),
                  ),
                  NotLoggedWidget(
                    icon: Icons.favorite,
                    text: "Ulubione znaleziska",
                    child: LinksList(
                      converterCallback: (store) =>
                          store.state.linksState.favoriteState,
                      loadDataCallback: (store, refresh, completer) =>
                          store.dispatch(loadLinksFavorite(refresh, completer)),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
