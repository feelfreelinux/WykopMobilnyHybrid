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
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShadowControlModel>(
      builder: (context) => ShadowControlModel(),
      child: DefaultTabController(
        length: 6,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppbarTabsWidget(
            tabs: <Widget>[
              Tab(text: 'Nowe'),
              Tab(text: 'Aktywne'),
              Tab(text: 'Gorące 6H'),
              Tab(text: 'Gorące 12H'),
              Tab(text: 'Gorące 24H'),
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
                key: PageStorageKey("HOT6"),
                child: EntriesList(
                  builder: (context) => EntryListModel(
                    loadNewEntries: (page) => api.entries.getHot(page, "6"),
                  ),
                ),
              ),
              Container(
                key: PageStorageKey("HOT12"),
                child: EntriesList(
                  builder: (context) => EntryListModel(
                    loadNewEntries: (page) => api.entries.getHot(page, "12"),
                  ),
                ),
              ),
              Container(
                key: PageStorageKey("HOT24"),
                child: EntriesList(
                  builder: (context) => EntryListModel(
                    loadNewEntries: (page) => api.entries.getHot(page, "24"),
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
