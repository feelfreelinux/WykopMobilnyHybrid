import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'dart:async';

class EntryLinkList extends StatelessWidget {
  final ConverterCallback converterCallback;
  final LoadDataCallback loadDataCallback;
  final Widget header;
  // screen type in redux used in error handling
  final String actionType;

  EntryLinkList(
      {this.converterCallback,
      this.actionType,
      this.loadDataCallback,
      this.header}) : super(key: PageStorageKey(actionType));

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
        child: StoreConnector<AppState, ItemListState>(
            converter: (store) => converterCallback(store),
            onInit: (store) {
              var state = converterCallback(store);
              if (state == null ||
                  state.paginationState.itemIds.isEmpty &&
                      !state.listState.haveReachedEnd) {
                loadDataCallback(store, false, Completer());
              }
            },
            builder: (context, state) {
              if (state == null ||
                  state.listState.isLoading && state.listState.page == 1) {
                return Center(child: CircularProgressIndicator());
              }
              return StoreConnector<AppState, ListRefreshCallback>(
                  converter: (store) {
                return (bool refresh, Completer completer) =>
                    loadDataCallback(store, refresh, completer);
              }, builder: (context, callback) {
                return RefreshIndicator(
                  onRefresh: () {
                    var completer = Completer();
                    callback(true, completer);
                    return completer.future;
                  },
                  child: ErrorHandlerWidget(
                    errorType: actionType,
                    errorStateConverter: (store) =>
                        converterCallback(store).errorState,
                    hasData: () => state.paginationState.itemIds.isNotEmpty,
                    child: InfiniteList(
                        header: header,
                        hasReachedEnd: state.listState.haveReachedEnd,
                        loadData: (completer) => callback(false, completer),
                        itemCount: state.paginationState.itemIds.length,
                        itemBuilder: (context, index) {
                          if (state.paginationState.itemIds[index] > 99999999) {
                            return EntryWidget(
                                entryId: state.paginationState.itemIds[index] ~/
                                    1000,
                                ellipsize: true);
                          } else {
                            return LinkWidget(
                                linkId: state.paginationState.itemIds[index]);
                          }
                        }),
                  ),
                );
              });
            }));
  }
}
