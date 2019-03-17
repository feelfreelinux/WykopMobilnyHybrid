import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';

class TagScreen extends StatefulWidget {
  final String tag;
  TagScreen({this.tag});
  @override
  _MainCollapsingToolbarState createState() => _MainCollapsingToolbarState();
}

class _MainCollapsingToolbarState extends State<TagScreen> {
  String list = "Wszystko";
  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);
    return MediaQuery(
      data: mqDataNew,
      child: Scaffold(
        appBar: AppbarNormalWidget(
          title: "#" + widget.tag,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {},
              tooltip: "Odśwież",
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.edit),
          onPressed: () {},
        ),
        body: _drawBody(),
      ),
    );
  }

  _drawBody() {
    if (list == "Wszystko") {
      return EntryLinkList(
          header: _drawHeader(),
          actionType: TAG_INDEX_PREFIX + widget.tag,
          converterCallback: (store) =>
              store.state.tagsState?.states[widget.tag]?.indexState,
          loadDataCallback: (store, refresh, completer) =>
              store.dispatch(loadTagIndex(widget.tag, refresh, completer)));
    } else if (list == "Wpisy") {
      return EntryList(
          header: _drawHeader(),
          actionType: TAG_ENTRIES_PREFIX + widget.tag,
          converterCallback: (store) =>
              store.state.tagsState.states[widget.tag].entriesState,
          loadDataCallback: (store, refresh, completer) =>
              store.dispatch(loadTagEntries(widget.tag, refresh, completer)));
    } else if (list == "Znaleziska") {
      return LinksList(
          header: _drawHeader(),
          actionType: TAG_LINKS_PREFIX + widget.tag,
          converterCallback: (store) =>
              store.state.tagsState.states[widget.tag].linksState,
          loadDataCallback: (store, refresh, completer) =>
              store.dispatch(loadTagLinks(widget.tag, refresh, completer)));
    }
  }

  Widget _drawHeader() {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100.0,
              child: Image(
                image: AdvancedNetworkImage(
                    "https://www.wykop.pl/cdn/c3397992/profile_background-feelfree_RyD5ErCHQ2.jpg"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(left: 18.0, right: 4.0),
          child: Row(
            children: <Widget>[
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  items: <String>['Wszystko', 'Znaleziska', 'Wpisy']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList(),
                  value: list,
                  onChanged: (value) {
                    setState(() {
                      list = value;
                    });
                  },
                ),
              ),
              Expanded(child: Container()),
              IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {},
              ),
            ],
          ),
        ),
        DividerWidget(
          padding: EdgeInsets.symmetric(
            horizontal: 18.0,
          ),
        ),
      ],
    );
  }
}
