import 'package:flutter/material.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'dart:async';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:redux/redux.dart';

typedef void SearchCallback(
    String query, Store<AppState> store, Completer completer);

class AppbarTabsWidget extends PreferredSize {
  final List<Widget> tabs;
  final VoidCallback onPressedSearch;
  final List<Widget> actions;
  final bool showCurrentUser;
  AppbarTabsWidget(
      {@required this.tabs,
      this.onPressedSearch,
      this.actions,
      this.showCurrentUser = true});

  @override
  Size get preferredSize {
    return Size.fromHeight(48.0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 2.0,
          ),
        ],
      ),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
          color: Theme.of(context).primaryColor,
          child: this.showCurrentUser ? AppbarUserWidget() : null,
        ),
        title: Stack(
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              child: TabBar(
                tabs: tabs,
                isScrollable: true,
                indicatorColor: Theme.of(context).primaryColor.withOpacity(0.0),
                labelStyle: TextStyle(
                  height: 1.15,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                ),
                unselectedLabelStyle: TextStyle(
                  height: 1.60,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
                labelPadding: EdgeInsets.symmetric(
                  vertical: 0.0,
                  horizontal: 14.0,
                ),
                unselectedLabelColor: Colors.grey[600],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 8.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).primaryColor.withOpacity(0.0),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 8.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      colors: [
                        Theme.of(context).primaryColor.withOpacity(0.0),
                        Theme.of(context).primaryColor,
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        actions: actions ??
            <Widget>[
              Container(
                color: Theme.of(context).primaryColor,
                child: IconButton(
                  iconSize: 26.0,
                  icon: Icon(Icons.search),
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: onPressedSearch ?? () {},
                  tooltip: "Szukaj",
                ),
              ),
            ],
        elevation: 0.0,
        centerTitle: true,
        titleSpacing: 0.0,
      ),
    );
  }
}

@immutable
class SearchAppbarWidget extends PreferredSize {
  final VoidCallback onClosedSearch;
  final SearchCallback searchCallback;
  SearchAppbarWidget({
    @required this.onClosedSearch,
    @required this.searchCallback,
  });

  final TextEditingController searchInputController = TextEditingController();

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
                    cursorWidth: 2.0,
                    cursorRadius: Radius.circular(20.0),
                    style: DefaultTextStyle.of(context).style.merge(
                          TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
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
        ),
      ),
      actions: <Widget>[
        IconButton(
          iconSize: 26.0,
          icon: Icon(Icons.close),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onPressed: onClosedSearch,
          tooltip: "Zamknij wyszukiwarkę",
        ),
      ],
      elevation: 1.5,
      centerTitle: true,
      titleSpacing: 0.0,
    );
  }
}
