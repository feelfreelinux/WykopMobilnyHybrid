import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:redux/redux.dart';
import 'dart:async';

typedef EntrylistState ConverterCallback(Store<AppState> store);
typedef void LoadDataCallback(Store<AppState> store, bool refresh, Completer completer);
typedef void RefreshCallback(bool refresh, Completer completer);

class EntryList extends StatelessWidget {
  final ConverterCallback converterCallback;
  final LoadDataCallback loadDataCallback;

  EntryList({this.converterCallback, this.loadDataCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
        child: StoreConnector<AppState, EntrylistState>(
            converter: (store) => converterCallback(store),
            onInit: (store) => loadDataCallback(store, false, Completer()),
            builder: (context, state) {
              if (state.listState.isLoading && state.listState.page == 1) {
                return Center(child: CircularProgressIndicator());
              }
              return StoreConnector<AppState, RefreshCallback>(converter: (store) {
                return (bool refresh, Completer completer) => loadDataCallback(store, refresh, completer);
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
                      itemCount: state.entriesState.itemIds.length,
                      itemBuilder: (context, index) {
                        return EntryWidget(
                            entryId: state.entriesState.itemIds[index],
                            ellipsize: true);
                      }),
                );
              });
            }));
  }
}
