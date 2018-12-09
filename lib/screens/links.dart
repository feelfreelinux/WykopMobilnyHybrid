import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'dart:async';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppbarTabsWidget(
          onPressetSearch: () {},
          tabs: <Widget>[
            Tab(text: 'GŁÓWNA'),
            Tab(text: 'WYKOPALISKO'),
            Tab(text: 'HITY')
          ]
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            LinksList(
                converterCallback: (store) => store.state.linksState.promotedState,
                loadDataCallback: (store, refresh, completer) =>
                    store.dispatch(loadPromoted(refresh, completer))
            ),
            Text('todo xDDD'),
            Text('todo xDDD')
          ],
        ),
      ),
    );
  }
}
