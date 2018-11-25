import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';

class MikroblogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
            appBar: AppbarTabsWidget(tabs: <Widget>[
              Tab(text: 'NOWE'),
              Tab(text: 'AKTYWNE'),
              Tab(text: 'GORĄCE 6H'),
              Tab(text: 'GORĄCE 12H'),
              Tab(text: 'GORĄCE 24H')
            ], onPressetSearch: () {}),
            body: TabBarView(children: [
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
                      store.dispatch(loadHot24()))
            ], physics: NeverScrollableScrollPhysics())));
  }
}
