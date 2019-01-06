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
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                elevation: 2.0,
                expandedHeight: 190,
                pinned: true,
                titleSpacing: 0,
                title: Text("#" + widget.tag),
                /*bottom: new TabBar(
                  tabs: [
                    Tab(text: 'WSZYSTKO'),
                    Tab(text: 'ZNALEZISKA'),
                    Tab(text: 'WPISY'),
                  ],
                  isScrollable: true,
                  indicator: BubbleTabIndicator(
                    indicatorHeight: 26.0,
                    indicatorColor: Theme.of(context).accentColor,
                    tabBarIndicatorSize: TabBarIndicatorSize.tab,
                    insets: EdgeInsets.symmetric(
                      horizontal: 3.0,
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
                ),*/

                flexibleSpace: FlexibleSpaceBar(
                    background: Column(children: [
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
                ])),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  AppbarPreferredSize(child: _renderDropdown()),
                ),
                floating: true,
              ),
            ];
          },
          body: Center(
            child: TabBarView(children: [
              EntryLinkList(
                  actionType: TAG_INDEX_PREFIX + widget.tag,
                  converterCallback: (store) =>
                      store.state.tagsState?.states[widget.tag]?.indexState,
                  loadDataCallback: (store, refresh, completer) => store
                      .dispatch(loadTagIndex(widget.tag, refresh, completer))),
              LinksList(
                  actionType: TAG_LINKS_PREFIX + widget.tag,
                  converterCallback: (store) =>
                      store.state.tagsState.states[widget.tag].linksState,
                  loadDataCallback: (store, refresh, completer) => store
                      .dispatch(loadTagLinks(widget.tag, refresh, completer))),
              EntryList(
                  actionType: TAG_ENTRIES_PREFIX + widget.tag,
                  converterCallback: (store) =>
                      store.state.tagsState.states[widget.tag].entriesState,
                  loadDataCallback: (store, refresh, completer) =>
                      store.dispatch(
                          loadTagEntries(widget.tag, refresh, completer))),
            ], physics: NeverScrollableScrollPhysics()),
          ),
        ),
      ),
    );
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
