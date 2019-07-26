import 'package:flutter/material.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'dart:async';


class AppbarTabsWidget extends StatefulWidget implements PreferredSizeWidget {
  final List<Widget> tabs;
  final VoidCallback onPressedSearch;
  final List<Widget> actions;

  AppbarTabsWidget({
    @required this.tabs,
    this.onPressedSearch,
    this.actions,
  });

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight);
  }

  _AppbarTabsWidgetState createState() => _AppbarTabsWidgetState();
}

class _AppbarTabsWidgetState extends State<AppbarTabsWidget> {
  bool shadow = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      decoration: Utils.appBarShadow(shadow),
      child: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: <Widget>[
              AppbarUserWidget(),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Container(
                      color: Theme.of(context).primaryColor,
                      child: TabBar(
                        tabs: widget.tabs,
                        isScrollable: true,
                        indicatorColor:
                            Theme.of(context).primaryColor.withOpacity(0.0),
                        labelStyle: TextStyle(
                          height: 1.45,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                        unselectedLabelStyle: TextStyle(
                          height: 2.20,
                          fontSize: 15.0,
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
              ),
              AppBarButton(
                  icon: Icons.search,
                  round: true,
                  onTap: widget.onPressedSearch ?? () {}),
            ],
          ),
        ),
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
  final dynamic searchCallback;
  final bool shadow;

  SearchAppbarWidget({
    @required this.onClosedSearch,
    @required this.searchCallback,
    this.shadow = true,
  });

  int _currentIndex = 0;

  final TextEditingController searchInputController = TextEditingController();

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight - 2
        //101.0
        );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      decoration: Utils.appBarShadow(shadow),
      child: /*Column(
        children: <Widget>[*/
          AppBar(
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: <Widget>[
              AppBarButton(
                icon: Icons.close,
                onTap: onClosedSearch,
                round: true,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    right: 8.0,
                    left: 4.0,
                  ),
                  color: Theme.of(context).primaryColor,
                  child: WillPopScope(
                    onWillPop: () {
                      onClosedSearch();
                      searchInputController.clear();
                    },
                    child: Container(
                      height: 36.0,
                      padding: EdgeInsets.symmetric(
                        vertical: 1.5,
                        horizontal: 12.0,
                      ),
                      decoration: BoxDecoration(
                        color: Utils.backgroundGreyOpacity(context),
                        borderRadius: BorderRadius.circular(36.0),
                      ),
                      child: TextField(
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
                          // callback(text);
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                          border: InputBorder.none,
                          hintText: 'Szukaj',
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .body1
                                  .color
                                  .withOpacity(0.7)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
        titleSpacing: 0.0,
      ),
      /*  Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 12.0,
              top: 6.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buttonTab(context, "Znaleziska", 0),
                _buttonTab(context, "Wpisy", 1),
                _buttonTab(context, "Użytkownicy", 2),
              ],
            ),
          )
        ],
      ),*/
    );
  }

  Widget _buttonTab(BuildContext context, String text, num index) {
    return Expanded(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 6.0),
            decoration: BoxDecoration(
                color: _currentIndex == index
                    ? Utils.backgroundGreyOpacity(context)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(80)),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _currentIndex == index
                    ? Theme.of(context).textTheme.body1.color
                    : Theme.of(context).textTheme.body1.color.withOpacity(0.6),
                fontWeight: FontWeight.bold,
                fontSize: 13.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
