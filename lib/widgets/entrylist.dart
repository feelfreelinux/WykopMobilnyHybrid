import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';

class EntryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
            decoration:
                new BoxDecoration(color: Theme.of(context).backgroundColor),
            child: StoreConnector<AppState, MikroblogState>(
                converter: (store) => store.state.mikroblogState,
                onInit: (store) {
                  store.dispatch(loadHotPeriod("12"));
                },
                builder: (context, state) {
                  if (state.listState.isLoading && state.listState.page == 1) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return StoreConnector<AppState, VoidCallback>(
                      converter: (store) {
                    return () => store.dispatch(loadHotPeriod("12"));
                  }, builder: (context, callback) {
                    return InfiniteList(
                        isLoading: state.listState.isLoading && state.listState.haveReachedEnd,
                        loadData: callback,
                        itemCount: state.entriesIds.length,
                        itemBuilder: (context, index) {
                          return EntryWidget(
                              entry: state.entries[state.entriesIds[index]],
                              ellipsize: true);
                        });
                  });
                }));
  }
}
