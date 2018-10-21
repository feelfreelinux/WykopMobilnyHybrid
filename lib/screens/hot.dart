import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/widgets/widgets.dart';

class HotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Gorące wpisy 12h'),
        ),
        body: StoreConnector<AppState, List<EntryResponse>>(
            converter: (store) => store.state.entries.toList(),
            onInit: (store) {
              store.dispatch(LoadHotAction());
            },
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.length,
                itemBuilder: (context, index) {
                  return EntryWidget(entry: state[index]);
                },
              );
            }));
  }
}
