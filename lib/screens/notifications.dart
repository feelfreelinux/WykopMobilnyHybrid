import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'dart:async';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
            appBar: AppbarTabsWidget(onPressedSearch: () {}, tabs: <Widget>[
              Tab(text: 'Powiadomienia'),
              Tab(text: 'Obserwowane tagi'),
            ]),
            body:
                TabBarView(physics: NeverScrollableScrollPhysics(), children: [
              NotificationsList(
                  converterCallback: (store) =>
                      store.state.notificationsState.notificationsState,
                  loadDataCallback: (store, refresh, completer) =>
                      store.dispatch(loadNotifications(refresh, completer))),
              NotificationsList(
                  converterCallback: (store) =>
                      store.state.notificationsState.hashTagsState,
                  loadDataCallback: (store, refresh, completer) => store
                      .dispatch(loadHashTagNotifications(refresh, completer))),
            ])));
  }
}
