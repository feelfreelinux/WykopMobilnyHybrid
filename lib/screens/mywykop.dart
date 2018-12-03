import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';

class MyWykopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
            appBar: AppbarTabsWidget(tabs: <Widget>[
              Tab(text: 'Indeks'),
            ], onPressetSearch: () {}),
            body: TabBarView(children: [
              EntryLinkList(
                  converterCallback: (store) =>
                      store.state.myWykopState.indexState,
                  loadDataCallback: (store, refresh, completer) =>
                      store.dispatch(loadIndex(refresh, completer))),
            ], physics: NeverScrollableScrollPhysics())));
  }
}
