import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/model/model.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isSearching = false;
  String searchQuery = "";
  int _currentIndex = 0;

  final TextEditingController searchInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);

    final List<Widget> _children = [
      Center(child: Text("Niezaimplementowane")),
      searchInputController.text.isNotEmpty
          ? LinksList(
              builder: (context) => LinkListModel(
                loadNewLinks: (page) =>
                    api.search.searchLinks(page, searchQuery),
              ),
            )
          : Container(),
      searchInputController.text.isNotEmpty
          ? EntriesList(
              builder: (context) => EntryListModel(
                loadNewEntries: (page) =>
                    api.search.searchEntries(page, searchQuery),
              ),
            )
          : Container(),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                "Ostatnie wyszukiwania",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.caption.color,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: <Widget>[
                  AvatarWidget(
                    author: Author.fromAuthState(
                        username: "feelfree",
                        color: 2,
                        avatarUrl:
                            "https://www.wykop.pl/cdn/c3397992/feelfree_2jiVf8ws9L,q40.jpg"),
                    size: 30.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("feelfree"),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: <Widget>[
                  AvatarWidget(
                    author: Author.fromAuthState(
                        username: "Kroguc",
                        color: 2,
                        avatarUrl:
                            "https://www.wykop.pl/cdn/c3397992/Kroguc_CgRE9t9IJo,q40.jpg"),
                    size: 30.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("Kroguc"),
                  )
                ],
              ),
            ),
          ],
        ),
      )
    ];

    return ChangeNotifierProvider<ShadowControlModel>(
      builder: (context) => ShadowControlModel(),
      child: MediaQuery(
        data: mqDataNew,
        child: Scaffold(
          appBar: AppbarNormalWidget(
            center: WillPopScope(
              onWillPop: () {
                searchInputController.clear();
              },
              child: TextField(
                autofocus: true,
                style: TextStyle(fontWeight: FontWeight.w600),
                maxLines: 1,
                controller: searchInputController,
                onSubmitted: (text) {
                  searchQuery = text;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
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
            actions: searchInputController.text.isNotEmpty
                ? <Widget>[
                    IconButtonWidget(
                      icon: Icons.close,
                      onTap: () => searchInputController.clear(),
                    )
                  ]
                : null,
            bottomHeight: 38,
            bottom: Padding(
              padding: EdgeInsets.only(bottom: 10.0, left: 18.0, right: 18.0),
              child: Row(
                children: <Widget>[
                  TabButtonWidget(
                    text: "Wszystko",
                    index: 0,
                    currentIndex: _currentIndex,
                    onTap: () => setState(() {
                      _currentIndex = 0;
                    }),
                  ),
                  TabButtonWidget(
                    text: "Linki",
                    index: 1,
                    currentIndex: _currentIndex,
                    onTap: () => setState(() {
                      _currentIndex = 1;
                    }),
                  ),
                  TabButtonWidget(
                    text: "Wpisy",
                    index: 2,
                    currentIndex: _currentIndex,
                    onTap: () => setState(() {
                      _currentIndex = 2;
                    }),
                  ),
                  TabButtonWidget(
                    text: "Osoby",
                    index: 3,
                    currentIndex: _currentIndex,
                    onTap: () => setState(() {
                      _currentIndex = 3;
                    }),
                  ),
                ],
              ),
            ),
          ),
          body: ShadowNotificationListener(
            child: _children[_currentIndex],
          ),
        ),
      ),
    );
  }
}
