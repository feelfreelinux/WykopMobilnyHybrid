import 'package:flutter/material.dart';
import 'dart:async';
import 'package:owmflutter/widgets/widgets.dart';

/*
 * Works around flutter#20495
 */
class NotSuddenJumpPhysics extends ClampingScrollPhysics {
  @override
  double get dragStartDistanceMotionThreshold => 3.5;
}

typedef void LoadMoreDataCallback(Completer completer);

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
  final LoadMoreDataCallback loadData;
  InfiniteList(
      {@required this.itemBuilder,
      @required this.itemCount,
      @required this.loadData,
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
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        widget.loadData(null);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    /*return ScrollConfiguration(
        behavior: NotSuddenJumpScrollBehavior(),
        child: CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == widget.itemCount - 1) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: widget.hasReachedEnd
                            ? Column(children: [
                                Text('To jest już koniec :)'),
                                Image.asset(
                                  'rogal.png',
                                  width: 100,
                                  height: 100,
                                )
                              ])
                            : CircularProgressIndicator(),
                      ),
                    );
                  }

                  return widget.itemBuilder(context, index);
                },
                childCount: widget.itemCount,
              ),
            )
          ],
          controller: _scrollController,
        ));*/
    return ScrollConfiguration(
      behavior: NotSuddenJumpScrollBehavior(),
      child: ShadowNotificationListener(
        child: ListView.builder(
          physics: NotSuddenJumpPhysics(),
          itemCount: widget.header != null
              ? widget.itemCount + 1
              : widget.itemCount + 0,
          itemBuilder: (context, index) {
            if (widget.header != null && index == 0) {
              return widget.header;
            }

            if (widget.header == null) {
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
