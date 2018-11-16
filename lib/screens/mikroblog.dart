import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/owm_glyphs.dart';

class MikroblogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
            leading: InkWell(
                child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                  width: 1,
                  height: 1,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://www.wykop.pl/cdn/c3397992/avatar_def,q80.png")))),
            )),
            titleSpacing: 0.0,
            centerTitle: true,
            elevation: 1.5,
            title: Text('Mikroblog'),
            actions: <Widget>[
              IconButton(
                icon: Icon(OwmGlyphs.ic_navi_search),
                onPressed: () {},
                tooltip: "Szukaj",
              ),
              IconButton(
                icon: Icon(OwmGlyphs.ic_refresh),
                onPressed: () {},
                tooltip: "Odśwież",
              )
            ],
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: 'Nowe'),
                Tab(text: 'Aktywne'),
                Tab(text: '6h'),
                Tab(text: '12h'),
                Tab(text: '24h'),
              ],
            )),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            EntryList(
                converterCallback: (store) =>
                    store.state.mikroblogState.newestState,
                loadDataCallback: (store, refresh) =>
                    store.dispatch(loadNewest())),
            EntryList(
                converterCallback: (store) =>
                    store.state.mikroblogState.activeState,
                loadDataCallback: (store, refresh) =>
                    store.dispatch(loadActive())),
            EntryList(
                converterCallback: (store) =>
                    store.state.mikroblogState.hot6State,
                loadDataCallback: (store, refresh) =>
                    store.dispatch(loadHot6())),
            EntryList(
                converterCallback: (store) =>
                    store.state.mikroblogState.hot12State,
                loadDataCallback: (store, refresh) =>
                    store.dispatch(loadHot12())),
            EntryList(
                converterCallback: (store) =>
                    store.state.mikroblogState.hot24State,
                loadDataCallback: (store, refresh) =>
                    store.dispatch(loadHot24())),
          ],
        ),
      ),
    );
  }
}
