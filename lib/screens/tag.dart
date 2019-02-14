import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

class TagScreen extends StatefulWidget {
  final String tag;
  TagScreen({this.tag});
  @override
  _MainCollapsingToolbarState createState() => _MainCollapsingToolbarState();
}

class _MainCollapsingToolbarState extends State<TagScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppbarNormalWidget(
          title: '#' + widget.tag,
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
              actionType: TAG_INDEX_PREFIX + widget.tag,
              converterCallback: (store) =>
                  store.state.tagsState?.states[widget.tag]?.indexState,
              loadDataCallback: (store, refresh, completer) =>
                  store.dispatch(loadTagIndex(widget.tag, refresh, completer))),
          LinksList(
              header: _drawHeader(),
              actionType: TAG_LINKS_PREFIX + widget.tag,
              converterCallback: (store) =>
                  store.state.tagsState.states[widget.tag].linksState,
              loadDataCallback: (store, refresh, completer) =>
                  store.dispatch(loadTagLinks(widget.tag, refresh, completer))),
          EntryList(
              header: _drawHeader(),
              actionType: TAG_ENTRIES_PREFIX + widget.tag,
              converterCallback: (store) =>
                  store.state.tagsState.states[widget.tag].entriesState,
              loadDataCallback: (store, refresh, completer) => store
                  .dispatch(loadTagEntries(widget.tag, refresh, completer))),
        ], physics: NeverScrollableScrollPhysics()),
      ),
    );
  }

  Widget _drawHeader() {
    return Column(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: Image(
          image: AdvancedNetworkImage(
              "https://www.wykop.pl/cdn/c3397992/profile_background-feelfree_RyD5ErCHQ2.jpg"),
          fit: BoxFit.fitWidth,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
            "Rozmowy o aktualnych wydarzeniach związanych z królową sportów motorowych oraz miejsce na wspomnienia pięknych momentów związanych z tym sportem"),
      ),
      _renderDropdown()
    ]);
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
                items: <String>['WSZYSTKO', 'ZNALEZISKA', 'WPISY']
                    .map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value,
                        style: TextStyle(
                            fontSize: 13.0, fontWeight: FontWeight.w600)),
                  );
                }).toList(),
                value: "WSZYSTKO",
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
