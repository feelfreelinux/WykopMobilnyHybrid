import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/screens/search.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';

import 'package:provider/provider.dart';

class AppbarTabsWidget extends StatefulWidget implements PreferredSizeWidget {
  final List<Widget> tabs;
  final List<Widget> actions;

  AppbarTabsWidget({@required this.tabs, this.actions});

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight);
  }

  _AppbarTabsWidgetState createState() => _AppbarTabsWidgetState();
}

class _AppbarTabsWidgetState extends State<AppbarTabsWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShadowControlModel>(
      builder: (context, shadowControlModel, _) => AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: Utils.appBarShadow(shadowControlModel.showTopShadow),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Container(
            color: Theme.of(context).backgroundColor,
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
                            height: 1.85,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                          ),
                          unselectedLabelStyle: TextStyle(
                            height: 2.95,
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
                                  Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.0),
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
                                  Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.0),
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
                RoundIconButtonWidget(
                  icon: Icons.search,
                  onTap: () => Navigator.push(
                      context, Utils.getPageTransition(SearchScreen())),
                ),
              ],
            ),
          ),
          elevation: 0.0,
          centerTitle: true,
          titleSpacing: 0.0,
        ),
      ),
    );
  }
}
