import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

class TagScreen4 extends StatelessWidget {
  final String tag;
  TagScreen4({this.tag});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          elevation: 1.5,
          leading: IconButton(
            icon: Container(
              margin: EdgeInsets.only(
                bottom: 8.0,
              ),
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.close,
              ),
            ),
            onPressed: () {
              Navigator.of(context).maybePop();
            },
          ),
          expandedHeight: 180.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Image(
              image: AdvancedNetworkImage(
                  "https://www.wykop.pl/cdn/c3397992/profile_background-feelfree_RyD5ErCHQ2.jpg"),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[],
          ),
        )
      ],
    );
  }
}

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
      appBar: null,
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                bottom: AppbarTabsWidget(
                  tabs: [
                    Tab(text: 'WSZYSTKO'),
                    Tab(text: 'ZNALEZISKA'),
                    Tab(text: 'WPISY'),
                  ],
                  actions: [],
                  showCurrentUser: false,
                ),
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
                    background: Image(
                  image: AdvancedNetworkImage(
                      "https://www.wykop.pl/cdn/c3397992/profile_background-feelfree_RyD5ErCHQ2.jpg"),
                  fit: BoxFit.fitWidth,
                )),
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
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

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

class TagScreen2 extends StatelessWidget {
  final String tag;
  TagScreen2({this.tag});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
          appBar: AppbarTabsWidget(tabs: <Widget>[
            Tab(text: 'WSZYSTKO'),
            Tab(text: 'ZNALEZISKA'),
            Tab(text: 'WPISY'),
          ], actions: []),
          body: TabBarView(children: [
            EntryLinkList(
                actionType: TAG_INDEX_PREFIX + tag,
                converterCallback: (store) =>
                    store.state.tagsState?.states[tag]?.indexState,
                loadDataCallback: (store, refresh, completer) =>
                    store.dispatch(loadTagIndex(tag, refresh, completer))),
            LinksList(
                actionType: TAG_LINKS_PREFIX + tag,
                converterCallback: (store) =>
                    store.state.tagsState.states[tag].linksState,
                loadDataCallback: (store, refresh, completer) =>
                    store.dispatch(loadTagLinks(tag, refresh, completer))),
            EntryList(
                actionType: TAG_ENTRIES_PREFIX + tag,
                converterCallback: (store) =>
                    store.state.tagsState.states[tag].entriesState,
                loadDataCallback: (store, refresh, completer) =>
                    store.dispatch(loadTagEntries(tag, refresh, completer))),
          ], physics: NeverScrollableScrollPhysics())),
    );
  }
}