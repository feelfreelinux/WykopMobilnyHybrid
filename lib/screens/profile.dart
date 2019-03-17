import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

class ProfileScreen extends StatefulWidget {
  final String profile;
  ProfileScreen({this.profile});
  @override
  _MainCollapsingToolbarState createState() => _MainCollapsingToolbarState();
}

class _MainCollapsingToolbarState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppbarNormalWidget(
          title: '@' + widget.profile,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.visibility),
              onPressed: () {},
              tooltip: "Obserwuj",
            ),
            IconButton(
              icon: Icon(Icons.lock),
              onPressed: () {},
              tooltip: "Zablokuj",
            ),
          ],
        ),
        body: TabBarView(children: [
          EntryLinkList(
              header: _drawHeader(),
              actionType: PROFILE_ACTIONS_PREFIX + widget.profile,
              converterCallback: (store) => store
                  .state.profilesState?.states[widget.profile]?.actionsState,
              loadDataCallback: (store, refresh, completer) => store
                  .dispatch(loadTagIndex(widget.profile, refresh, completer))),
        ], physics: NeverScrollableScrollPhysics()),
      ),
    );
  }

  Widget _drawHeader() {
    return Text('Header');
  }

  Widget _renderDropdown() {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                items: <String>['AKCJE'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value,
                        style: TextStyle(
                            fontSize: 13.0, fontWeight: FontWeight.w600)),
                  );
                }).toList(),
                value: "AKCJE",
                onChanged: (_) {},
              ),
            ),
            Expanded(child: Container()),
            Icon(Icons.menu)
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final PreferredSizeWidget _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

@immutable
class AppbarPreferredSize extends PreferredSize {
  final Widget child;
  final double height;
  AppbarPreferredSize({
    @required this.child,
    this.height = 48,
  });

  @override
  Size get preferredSize {
    return Size.fromHeight(height);
  }

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
