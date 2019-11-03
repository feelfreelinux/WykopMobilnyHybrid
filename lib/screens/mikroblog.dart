import 'package:flutter/material.dart';
import 'package:owmflutter/model/entry_list_model.dart';
import 'package:owmflutter/utils/utils.dart';
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
  void initState() {
    int screenIndex =
        Provider.of<OWMSettings>(context, listen: false).defaultEntryScreen;

    if (screenIndex == 3) {
      hotScreen = 12;
    } else if (screenIndex == 4) {
      hotScreen = 24;
    }
    super.initState();
  }

  int _getDefaultScreenIndex(BuildContext context) {
    int screenIndex =
        Provider.of<OWMSettings>(context, listen: false).defaultEntryScreen;
    if (screenIndex > 1) {
      if (screenIndex < 5) {
        return 2;
      }
      return screenIndex - 3;
    }
    return Provider.of<OWMSettings>(context, listen: false).defaultEntryScreen;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShadowControlModel>(
      builder: (context) => ShadowControlModel(),
      child: DefaultTabController(
        length: 4,
        initialIndex: _getDefaultScreenIndex(context),
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
            physics: NeverScrollableScrollPhysics(),
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
                  header: FloatingTabsHeader(
                    children: <Widget>[
                      TabButtonWidget(
                        text: "6 godz.",
                        index: 6,
                        currentIndex: hotScreen,
                        onTap: () => setState(() => hotScreen = 6),
                      ),
                      TabButtonWidget(
                        text: "12 godz.",
                        index: 12,
                        currentIndex: hotScreen,
                        onTap: () => setState(() => hotScreen = 12),
                      ),
                      TabButtonWidget(
                        text: "24 godz.",
                        index: 24,
                        currentIndex: hotScreen,
                        onTap: () => setState(() => hotScreen = 24),
                      ),
                    ],
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
