import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/model/model.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);

    final List<dynamic> _children = [
      (query) =>
          SearchResultPage(searchResType: SearchResultType.LINK, query: query),
      (query) =>
          SearchResultPage(searchResType: SearchResultType.ENTRY, query: query),
      (_) => _getHistory(),
    ];

    return Consumer<OWMSettings>(
      builder: (context, settings, _) =>
          ChangeNotifierProvider<SearchScreenModel>(
        builder: (context) => SearchScreenModel(settings: settings),
        child: ChangeNotifierProvider<ShadowControlModel>(
          builder: (context) => ShadowControlModel(),
          child: MediaQuery(
            data: mqDataNew,
            child: Scaffold(
              appBar: AppbarNormalWidget(
                center: Consumer<SearchScreenModel>(
                  builder: (context, model, _) => WillPopScope(
                    onWillPop: () {
                      model.searchInputController.clear();
                      Navigator.of(context).pop();
                    },
                    child: Consumer<SearchScreenModel>(
                      builder: (context, searchModel, _) => TextField(
                        autofocus: true,
                        style: TextStyle(fontWeight: FontWeight.w600),
                        maxLines: 1,
                        controller: model.searchInputController,
                        onSubmitted: (text) {
                          searchModel.setQuery();
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 12.0),
                          border: InputBorder.none,
                          hintText: 'Szukaj',
                          hintStyle: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .body1
                                .color
                                .withOpacity(0.7),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                actions: <Widget>[
                  Consumer<SearchScreenModel>(
                      builder: (context, model, _) => model
                              .searchInputController.text.isNotEmpty
                          ? IconButtonWidget(
                              icon: Icons.close,
                              onTap: () => model.searchInputController.clear(),
                            )
                          : Container())
                ],
                bottomHeight: 38,
                bottom: Padding(
                  padding:
                      EdgeInsets.only(bottom: 10.0, left: 18.0, right: 18.0),
                  child: Row(
                    children: <Widget>[
                      TabButtonWidget(
                        text: "Linki",
                        index: 0,
                        currentIndex: _currentIndex,
                        onTap: () => setState(() => _currentIndex = 0),
                      ),
                      TabButtonWidget(
                        text: "Wpisy",
                        index: 1,
                        currentIndex: _currentIndex,
                        onTap: () => setState(() => _currentIndex = 1),
                      ),
                      TabButtonWidget(
                        text: "Osoby",
                        index: 2,
                        currentIndex: _currentIndex,
                        onTap: () => setState(() => _currentIndex = 2),
                      ),
                    ],
                  ),
                ),
              ),
              body: Consumer<SearchScreenModel>(
                builder: (context, model, _) => ShadowNotificationListener(
                  child: model.isEditing
                      ? _getHistory()
                      : _children[_currentIndex](model.query),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getHistory() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 18.0),
            child: Text(
              "Ostatnio wyszukiwane",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).textTheme.caption.color,
              ),
            ),
          ),
          Visibility(
            visible:
                Provider.of<OWMSettings>(context).searchHistory.length == 0,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 18.0),
              child: Text("Tutaj pojawi się kilka ostatnich wyszukiwań"),
            ),
          ),
          ...List<int>.generate(
                  Provider.of<OWMSettings>(context).searchHistory.length >= 5
                      ? 5
                      : Provider.of<OWMSettings>(context).searchHistory.length,
                  (i) => i)
              .map((e) => Consumer<SearchScreenModel>(
                    builder: (context, model, _) {
                      var suggestion =
                          Provider.of<OWMSettings>(context, listen: false)
                              .searchHistory
                              .reversed
                              .toList()[e];
                      return ListTile(
                        onTap: () =>
                            model.searchInputController.text = suggestion,
                        leading: Icon(Icons.access_time),
                        trailing: Icon(Icons.navigate_next),
                        title: Text(suggestion),
                      );
                    },
                  ))
              .toList(),
        ],
      ),
    );
  }
}

enum SearchResultType {
  LINK,
  ENTRY,
}

class SearchResultPage extends StatefulWidget {
  final SearchResultType searchResType;
  final String query;
  SearchResultPage({this.searchResType, this.query});

  @override
  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage>
    with AutomaticKeepAliveClientMixin<SearchResultPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.searchResType == SearchResultType.LINK) {
      return Container(
        child: LinksList(
          builder: (context) => LinkListModel(
            context: context, loadNewLinks: (page) => api.search.searchLinks(page, widget.query),
          ),
        ),
      );
    } else {
      return Container(
        child: EntriesList(
          builder: (context) => EntryListModel(
            context: context, loadNewEntries: (page) =>
                api.search.searchEntries(page, widget.query),
          ),
        ),
      );
    }
    return Container();
  }

  @override
  bool get wantKeepAlive => true;
}
