import 'package:flutter/material.dart';

typedef ItemBuilder = Widget Function(BuildContext, int);

class InfiniteList extends StatefulWidget {
  final int itemCount;
  final ItemBuilder itemBuilder;
  final bool isLoading;
  final VoidCallback loadData;
  InfiniteList({this.itemBuilder, this.itemCount, this.isLoading, this.loadData});

  @override
  _InfiniteListState createState() => _InfiniteListState();
}

class _InfiniteListState extends State<InfiniteList> {
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (!widget.isLoading && _scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        widget.loadData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.itemCount + 1,
      itemBuilder: (context, index) {
        if (index == widget.itemCount) {
          return new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Center(
              child: new Opacity(
                opacity: widget.isLoading ? 1.0 : 0.0,
                child: new CircularProgressIndicator(),
              ),
            ),
          );
        }

        return widget.itemBuilder(context, index);
      },
      controller: _scrollController,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
