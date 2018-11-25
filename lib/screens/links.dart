import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
            appBar: AppbarTabsWidget(onPressetSearch: () {}, tabs: <Widget>[
              Tab(text: 'GŁÓWNA'),
              Tab(text: 'WYKOPALISKO'),
              Tab(text: 'HITY')
            ]),
            body:
                TabBarView(physics: NeverScrollableScrollPhysics(), children: [
              LinksList(
                  converterCallback: (store) =>
                      store.state.linksState.promotedState,
                  loadDataCallback: (store, refresh) =>
                      store.dispatch(loadPromoted())),
              Text('todo xDDD'),
              Text('todo xDDD')
            ])));
  }
}
