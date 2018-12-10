import 'package:flutter/material.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchableAppbarTabsWidget extends StatefulWidget {
  final List<Widget> tabs;
  final SearchCallback searchCallback;

  SearchableAppbarTabsWidget({this.tabs, this.searchCallback});

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

  Widget _renderSearchInput() {
    return Container(
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
        style:
            DefaultTextStyle.of(context).style.merge(TextStyle(fontSize: 14.0)),
        maxLines: 1,
        onSubmitted: (text) {
          widget.searchCallback(text);
          setState(() {
            isSearching = false;
          });
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

  AppbarTabsWidget({@required this.tabs, this.onSearch});

  @override
  Size get preferredSize {
    return Size.fromHeight(48.0);
  }

  @override
  Widget build(BuildContext context) {
    return SearchableAppbarTabsWidget(tabs: tabs, searchCallback: onSearch);
  }
}
