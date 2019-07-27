import 'package:flutter/material.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider<ShadowControlModel>(
      builder: (context) => ShadowControlModel(),
      child: MediaQuery(
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
      ),
    );
  }

  _drawBody() {
    if (list == "Wszystko") {
      return EntriesLinksList(
        header: _drawHeader(),
        builder: (context) => EntryLinkListModel(
          loadEntryLinks: (page) => api.tags.getIndex(widget.tag, page),
        ),
      );
    } else if (list == "Wpisy") {
      return EntriesList(
        header: _drawHeader(),
        builder: (context) => EntryListModel(
          loadNewEntries: (page) => api.tags.getEntries(widget.tag, page),
        ),
      );
    } else if (list == "Znaleziska") {
      return LinksList(
        header: _drawHeader(),
        builder: (context) => LinkListModel(
          loadNewLinks: (page) => api.tags.getLinks(widget.tag, page),
        ),
      );
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
