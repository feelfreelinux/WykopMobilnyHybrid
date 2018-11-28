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
