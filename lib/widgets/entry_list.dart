import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:redux/redux.dart';

typedef ItemListState ConverterCallback(Store<AppState> store);
typedef void LoadDataCallback(
    Store<AppState> store, bool refresh, Completer completer);
typedef void ListRefreshCallback(bool refresh, Completer completer);

class EntryList extends StatefulWidget {
  final ConverterCallback converterCallback;
  final LoadDataCallback loadDataCallback;

  EntryList({this.converterCallback, this.loadDataCallback});

  @override
  EntryListState createState() {
    return new EntryListState();
  }
}

class EntryListState extends State<EntryList> {
  double scrollPixels = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
        child: StoreConnector<AppState, ItemListState>(
            converter: (store) => widget.converterCallback(store),
            onInit: (store) =>
                widget.loadDataCallback(store, true, Completer()),
            builder: (context, state) {
              if (state == null ||
                  state.listState.isLoading && state.listState.page == 1) {
                return Center(child: CircularProgressIndicator());
              }
              return StoreConnector<AppState, ListRefreshCallback>(
                  converter: (store) {
                return (bool refresh, Completer completer) =>
                    widget.loadDataCallback(store, refresh, completer);
              }, builder: (context, callback) {
                return RefreshIndicator(
                  onRefresh: () {
                    var completer = Completer();
                    callback(true, completer);
                    return completer.future;
                  },
                  child: InfiniteList(
                      isLoading: state.listState.isLoading,
                      hasReachedEnd: state.listState.haveReachedEnd,
                      loadData: () => callback(false, Completer()),
                      itemCount: state.paginationState.itemIds.length,
                      itemBuilder: (context, index) {
                        return EntryWidget(
                            entryId: state.paginationState.itemIds[index],
                            ellipsize: true);
                      }),
                );
              });
            }));
  }
}
