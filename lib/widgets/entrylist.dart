import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:redux/redux.dart';

typedef EntrylistState ConverterCallback(Store<AppState> store);
typedef void LoadDataCallback(Store<AppState> store, bool refresh);

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
            onInit: (store) => loadDataCallback(store, false),
            builder: (context, state) {
              if (state.listState.isLoading && state.listState.page == 1) {
                return Center(child: CircularProgressIndicator());
              }
              return StoreConnector<AppState, VoidCallback>(converter: (store) {
                return () => loadDataCallback(store, false);
              }, builder: (context, callback) {
                return InfiniteList(
                    isLoading: state.listState.isLoading &&
                        state.listState.haveReachedEnd,
                    loadData: callback,
                    itemCount: state.entriesState.itemIds.length,
                    itemBuilder: (context, index) {
                      return EntryWidget(
                          entryId: state.entriesState.itemIds[index],
                          ellipsize: true);
                    });
              });
            }));
  }
}
