import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:owmflutter/widgets/widgets.dart';

/*
 * Works around flutter#20495
 */
class NotSuddenJumpPhysics extends ClampingScrollPhysics {
  @override
  double get dragStartDistanceMotionThreshold => 3.5;
}

typedef Future<void> LoadMoreDataCallback();

class NotSuddenJumpScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
        return const BouncingScrollPhysics();
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return NotSuddenJumpPhysics();
    }
    return null;
  }
}

typedef ItemBuilder = Widget Function(BuildContext, int);

class InfiniteList extends StatefulWidget {
  final int itemCount;
  final ItemBuilder itemBuilder;
  final Widget header;
  final WidgetBuilder headerBuilder;
  final bool isLoading;
  final LoadMoreDataCallback loadData;
  InfiniteList(
      {@required this.itemBuilder,
      @required this.itemCount,
      @required this.loadData,
      this.isLoading = false,
      this.headerBuilder,
      this.header});

  @override
  _InfiniteListState createState() => _InfiniteListState();
}

class _InfiniteListState extends State<InfiniteList> {
  ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !(isLoading || widget.isLoading)) {
        print('startLoading');
        setState(() {
          isLoading = true;
        });
        try {
          await widget.loadData();
        } catch (e) {}
        setState(() {
          isLoading = false;
        });
        print('stopLoading');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var itemCount = widget.itemCount + ((widget.isLoading || isLoading) ? 1 : 0);
    var headerWidget = widget.header ?? (widget.headerBuilder != null ? widget.headerBuilder(context) : Container());

    return ScrollConfiguration(
      behavior: NotSuddenJumpScrollBehavior(),
      child: ShadowNotificationListener(
        scrollController: _scrollController,
        hideOnAllTop: (headerWidget is SliverPersistentHeader),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            (headerWidget is SliverPersistentHeader) ? headerWidget : SliverToBoxAdapter(child: headerWidget),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == (itemCount - 1) && (isLoading || widget.isLoading)) {
                    return Padding(
                      padding: EdgeInsets.all(60.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  return widget.itemBuilder(context, index);
                },
                childCount: itemCount,
              ),
            ),
          ],
        ),
      ),
    );
    return ScrollConfiguration(
      behavior: NotSuddenJumpScrollBehavior(),
      child: ShadowNotificationListener(
        child: ListView.builder(
          physics: NotSuddenJumpPhysics(),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            if ((widget.header != null || widget.headerBuilder != null) &&
                index == 0) {
              return widget.header ?? widget.headerBuilder(context);
            }
            if (index == (itemCount - 1) && isLoading) {
              print('wooo');
              return Padding(
                padding: EdgeInsets.all(60.0),
                child: Center(child: CircularProgressIndicator()),
              );
            }

            if (widget.header == null && widget.headerBuilder == null) {
              return widget.itemBuilder(context, index);
            } else {
              return widget.itemBuilder(context, index - 1);
            }
          },
          controller: _scrollController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
