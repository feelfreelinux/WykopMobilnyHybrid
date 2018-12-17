import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:redux/redux.dart';
import 'dart:async';

class NotificationsList extends StatelessWidget {
  final ConverterCallback converterCallback;
  final LoadDataCallback loadDataCallback;

  NotificationsList({this.converterCallback, this.loadDataCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
        child: StoreConnector<AppState, ItemListState>(
            converter: (store) => converterCallback(store),
            onInit: (store) => loadDataCallback(store, true, Completer()),
            builder: (context, state) {
              if (state == null ||
                  state.listState.isLoading && state.listState.page == 1) {
                return Center(child: CircularProgressIndicator());
              }
              return StoreConnector<AppState, dynamic>(converter: (store) {
                return (bool refresh, Completer completer) =>
                    loadDataCallback(store, refresh, completer);
              }, builder: (context, callback) {
                return RefreshIndicator(
                    onRefresh: () {
                      var completer = Completer();
                      callback(true, completer);
                      return completer.future;
                    },
                    child: InfiniteList(
                        hasReachedEnd: state.listState.haveReachedEnd,
                        loadData: (completer) => callback(false, completer),
                        itemCount: state.paginationState.itemIds.length,
                        itemBuilder: (context, index) {
                          return NotificationWidget(
                              notificationId:
                                  state.paginationState.itemIds[index]);
                        }));
              });
            }));
  }
}
