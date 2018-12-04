import 'package:flutter/material.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

class AppbarTabsWidget extends PreferredSize {
  final List<Widget> tabs;
  final VoidCallback onPressetSearch;
  AppbarTabsWidget({@required this.tabs, @required this.onPressetSearch});

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
              icon: Icon(OwmGlyphs.ic_navi_search),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: onPressetSearch,
              tooltip: "Szukaj")
        ],
        elevation: 1.5,
        centerTitle: true,
        titleSpacing: 0.0);
  }
}
