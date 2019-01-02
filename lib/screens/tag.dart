import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';

class TagScreen extends StatelessWidget {
  final String tag;
  TagScreen({this.tag});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
          appBar: AppbarTabsWidget(onPressedSearch: () {}, tabs: <Widget>[
            Tab(text: 'WSZYSTKO'),
            Tab(text: 'ZNALEZISKA'),
            Tab(text: 'WPISY'),
          ]),
          body: TabBarView(children: [
            EntryLinkList(
                actionType: TAG_INDEX_PREFIX + tag,
                converterCallback: (store) =>
                    store.state.tagsState.states[tag].indexState,
                loadDataCallback: (store, refresh, completer) =>
                    store.dispatch(loadTagIndex(tag, refresh, completer))),
            LinksList(
                actionType: TAG_LINKS_PREFIX + tag,
                converterCallback: (store) =>
                    store.state.tagsState.states[tag].linksState,
                loadDataCallback: (store, refresh, completer) =>
                    store.dispatch(loadTagLinks(tag, refresh, completer))),
            EntryList(
                actionType: TAG_ENTRIES_PREFIX + tag,
                converterCallback: (store) =>
                    store.state.tagsState.states[tag].entriesState,
                loadDataCallback: (store, refresh, completer) =>
                    store.dispatch(loadTagEntries(tag, refresh, completer))),
          ], physics: NeverScrollableScrollPhysics())),
    );
  }
}
