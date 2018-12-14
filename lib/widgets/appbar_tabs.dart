import 'package:flutter/material.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';

class SearchableAppbarTabsWidget extends StatefulWidget {
  final List<Widget> tabs;
  final SearchCallback searchCallback;
  final VoidCallback closeCallback;
  final VoidCallback openCallback;

  SearchableAppbarTabsWidget(
      {this.tabs, this.searchCallback, this.closeCallback, this.openCallback});

  _SearchableAppbarTabsWidgetState createState() =>
      _SearchableAppbarTabsWidgetState();
}

class _SearchableAppbarTabsWidgetState
    extends State<SearchableAppbarTabsWidget> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: AppbarUserWidget(),
      title: Container(
        color: Theme.of(context).primaryColor,
        child: !isSearching ? _renderTabs() : _renderSearchInput(),
      ),
      actions: <Widget>[
        !isSearching
            ? IconButton(
                iconSize: 20.0,
                icon: Icon(FontAwesomeIcons.search),
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () {
                  widget.openCallback();
                  setState(() {
                    isSearching = true;
                  });
                },
                tooltip: "Szukaj",
              )
            : IconButton(
                iconSize: 22.0,
                icon: Icon(FontAwesomeIcons.times),
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () {
                  searchInputController.clear();
                  widget.closeCallback();
                  setState(() {
                    isSearching = false;
                  });
                },
                tooltip: "Zamknij wyszukiwarkę",
              ),
      ],
      elevation: 1.5,
      centerTitle: true,
      titleSpacing: 0.0,
    );
  }

  TextEditingController searchInputController = TextEditingController();

  Widget _renderSearchInput() {
    return WillPopScope(
      onWillPop: () {
        widget.closeCallback();
        searchInputController.clear();
        setState(() {
          isSearching = false;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 1.0,
          horizontal: 12.0,
        ),
        decoration: BoxDecoration(
          color: Color(0x267f7f7f),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: TextField(
          cursorWidth: 1.5,
          cursorRadius: Radius.circular(20.0),
          style: DefaultTextStyle.of(context)
              .style
              .merge(TextStyle(fontSize: 14.0)),
          maxLines: 1,
          controller: searchInputController,
          onSubmitted: (text) {
            widget.searchCallback(text);
          },
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            border: InputBorder.none,
            hintText: 'Szukaj',
          ),
        ),
      ),
    );
  }

  Widget _renderTabs() {
    return TabBar(
      tabs: widget.tabs,
      isScrollable: true,
      indicator: BubbleTabIndicator(
        indicatorHeight: 26.0,
        indicatorColor: Theme.of(context).accentColor,
        tabBarIndicatorSize: TabBarIndicatorSize.tab,
        insets: EdgeInsets.symmetric(
          horizontal: 2.0,
        ),
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: Colors.white,
      labelStyle: TextStyle(
        fontSize: 11.0,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      labelPadding: EdgeInsets.symmetric(
        vertical: 18.0,
        horizontal: 14.0,
      ),
      unselectedLabelColor: Colors.grey[600],
    );
  }
}

typedef void SearchCallback(String query);

class AppbarTabsWidget extends PreferredSize {
  final List<Widget> tabs;
  final SearchCallback onSearch;
  final VoidCallback openCallback;
  final VoidCallback closeCallback;

  AppbarTabsWidget(
      {@required this.tabs,
      this.onSearch,
      this.closeCallback,
      this.openCallback});

  @override
  Size get preferredSize {
    return Size.fromHeight(48.0);
  }

  @override
  Widget build(BuildContext context) {
    return SearchableAppbarTabsWidget(
      tabs: tabs,
      searchCallback: onSearch,
      closeCallback: this.closeCallback,
      openCallback: this.openCallback,
    );
  }
}

typedef void SearchCallback2(String query, Store<AppState> store, Completer completer);

class AppbarTabsWidget2 extends PreferredSize {
  final List<Widget> tabs;
  final VoidCallback onPressedSearch;
  AppbarTabsWidget2({@required this.tabs, @required this.onPressedSearch});

  @override
  Size get preferredSize {
    return Size.fromHeight(48.0);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: AppbarUserWidget(),
        title: Container(
            color: Theme.of(context).primaryColor,
            child: TabBar(
                tabs: tabs,
                isScrollable: true,
                indicator: BubbleTabIndicator(
                    indicatorHeight: 26.0,
                    indicatorColor: Theme.of(context).accentColor,
                    tabBarIndicatorSize: TabBarIndicatorSize.tab,
                    insets: EdgeInsets.symmetric(horizontal: 2.0)),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
                labelStyle: TextStyle(
                    fontSize: 11.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
                labelPadding:
                    EdgeInsets.symmetric(vertical: 18.0, horizontal: 14.0),
                unselectedLabelColor: Colors.grey[600])),
        actions: <Widget>[
          IconButton(
              iconSize: 22.0,
              icon: Icon(FontAwesomeIcons.search),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: onPressedSearch,
              tooltip: "Szukaj")
        ],
        elevation: 1.5,
        centerTitle: true,
        titleSpacing: 0.0);
  }
}

class SeachAppbarWidget extends PreferredSize {
  final VoidCallback onClosedSearch;
  final SearchCallback2 searchCallback;
  SeachAppbarWidget(
      {@required this.onClosedSearch, @required this.searchCallback});
  TextEditingController searchInputController = TextEditingController();

  @override
  Size get preferredSize {
    return Size.fromHeight(48.0);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: AppbarUserWidget(),
        title: Container(
            color: Theme.of(context).primaryColor,
            child: WillPopScope(
              onWillPop: () {
                onClosedSearch();
                searchInputController.clear();
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 1.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Color(0x267f7f7f),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: StoreConnector<AppState, dynamic>(
                  converter: (store) =>
                      (query) => searchCallback(query, store, Completer()),
                  builder: (context, callback) => TextField(
                        cursorWidth: 1.5,
                        cursorRadius: Radius.circular(20.0),
                        style: DefaultTextStyle.of(context)
                            .style
                            .merge(TextStyle(fontSize: 14.0)),
                        maxLines: 1,
                        controller: searchInputController,
                        onSubmitted: (text) {
                          callback(text);
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0,
                          ),
                          border: InputBorder.none,
                          hintText: 'Szukaj',
                        ),
                      ),
                ),
              ),
            )),
        actions: <Widget>[
          IconButton(
              iconSize: 22.0,
              icon: Icon(FontAwesomeIcons.times),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: onClosedSearch,
              tooltip: "Zamknij wyszukiwarkę")
        ],
        elevation: 1.5,
        centerTitle: true,
        titleSpacing: 0.0);
  }
}
