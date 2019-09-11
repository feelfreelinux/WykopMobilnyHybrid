import 'package:flutter/material.dart';
import 'package:owmflutter/model/entry_list_model.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/model/model.dart';
import 'package:provider/provider.dart';

class MikroblogScreen extends StatefulWidget {
  _MikroblogScreenState createState() => _MikroblogScreenState();
}

class _MikroblogScreenState extends State<MikroblogScreen> {
  num hotScreen = 6;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShadowControlModel>(
      builder: (context) => ShadowControlModel(),
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppbarTabsWidget(
            tabs: <Widget>[
              Tab(text: 'Nowe'),
              Tab(text: 'Aktywne'),
              Tab(text: 'Gorące'),
              Tab(text: 'Ulubione'),
            ],
          ),
          body: TabBarView(
            children: [
              Container(
                key: PageStorageKey("NEWEST"),
                child: EntriesList(
                  builder: (context) => EntryListModel(
                    loadNewEntries: (page) => api.entries.getNewest(page),
                  ),
                ),
              ),
              Container(
                key: PageStorageKey("ACTIVE"),
                child: EntriesList(
                  builder: (context) => EntryListModel(
                    loadNewEntries: (page) => api.entries.getActive(page),
                  ),
                ),
              ),
              Container(
                key: PageStorageKey("HOT" + hotScreen.toString()),
                child: EntriesList(
                  header: Material(
                    type: MaterialType.transparency,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: 6.0, top: 10.0, right: 18.0, left: 18.0),
                      child: Row(
                        children: <Widget>[
                          TabButtonWidget(
                            text: "6h",
                            index: 6,
                            currentIndex: hotScreen,
                            onTap: () => setState(() => hotScreen = 6),
                          ),
                          TabButtonWidget(
                            text: "12h",
                            index: 12,
                            currentIndex: hotScreen,
                            onTap: () => setState(() => hotScreen = 12),
                          ),
                          TabButtonWidget(
                            text: "24h",
                            index: 24,
                            currentIndex: hotScreen,
                            onTap: () => setState(() => hotScreen = 24),
                          ),
                        ],
                      ),
                    ),
                  ),
                  builder: (context) => EntryListModel(
                    loadNewEntries: (page) =>
                        api.entries.getHot(page, hotScreen.toString()),
                  ),
                ),
              ),
              NotLoggedWidget(
                icon: Icons.favorite,
                text: "Ulubione wpisy",
                child: Center(
                  child: Container(
                    key: PageStorageKey("FAVORITE"),
                    child: EntriesList(
                      builder: (context) => EntryListModel(
                        loadNewEntries: (page) => api.entries.getFavorite(page),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
