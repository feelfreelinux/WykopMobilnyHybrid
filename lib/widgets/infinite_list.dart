import 'package:flutter/material.dart';

/**
 * Works around flutter#20495
 */
class _Physics extends ClampingScrollPhysics {
  @override
  double get dragStartDistanceMotionThreshold => 3.5;
}

class _ScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
        return const BouncingScrollPhysics();
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return _Physics();
    }
    return null;
  }
}

typedef ItemBuilder = Widget Function(BuildContext, int);

class InfiniteList extends StatefulWidget {
  final int itemCount;
  final ItemBuilder itemBuilder;
  final bool isLoading;
  final VoidCallback loadData;
  InfiniteList(
      {this.itemBuilder, this.itemCount, this.isLoading, this.loadData});

  @override
  _InfiniteListState createState() => _InfiniteListState();
}

class _InfiniteListState extends State<InfiniteList> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (!widget.isLoading &&
          _scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) {
        widget.loadData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: _ScrollBehavior(),
        child: ListView.builder(
          physics: _Physics(),
          itemCount: widget.itemCount + 1,
          itemBuilder: (context, index) {
            if (index == widget.itemCount) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Opacity(
                    opacity: widget.isLoading ? 1.0 : 0.0,
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            }

            return widget.itemBuilder(context, index);
          },
          controller: _scrollController,
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
