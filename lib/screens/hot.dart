import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';

class HotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Gorące wpisy 12h'),
        ),
        body: Container(
            decoration:
                new BoxDecoration(color: Theme.of(context).backgroundColor),
            child: StoreConnector<AppState, MikroblogState>(
                converter: (store) => store.state.mikroblogState,
                onInit: (store) {
                  store.dispatch(LoadHotAction());
                },
                builder: (context, state) {
                  if (state.isLoading && state.page == 1) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return StoreConnector<AppState, VoidCallback>(
                    converter: (store) { return () => store.dispatch(LoadHotAction()); },
                    builder: (context, callback) {
return InfiniteList(
                    isLoading: state.isLoading,
                    loadData: callback,
                    itemCount: state.entries.length,
                    itemBuilder: (context, index) {
                      return EntryWidget(entry: state.entries[index]);
                    }
                    
                  );
                    }
                  
                  );
                })));
  }
}
