import 'dart:async';
import 'package:flutter/material.dart';
import 'package:owmflutter/content_filters/content_filters.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

typedef T ModelBuilder<T>(BuildContext context);

class ItemList<T, D extends ChangeNotifier> extends StatefulWidget {
  final ModelBuilder<ListModel<T, D>> builder;
  final Widget header;
  final WidgetBuilder persistentHeaderBuilder;
  final WidgetBuilder headerBuilder;
  final WidgetBuilder buildChildren;
  ItemList({this.builder, this.header, this.buildChildren, this.headerBuilder, this.persistentHeaderBuilder});

  @override
  ItemListState<T, D> createState() {
    return new ItemListState();
  }
}

class ItemListState<T, D extends ChangeNotifier> extends State<ItemList<T, D>>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: ChangeNotifierProvider<ListModel<T, D>>(
        builder: widget.builder,
        child: Consumer<ListModel<T, D>>(
          builder: (context, model, _) => RefreshIndicator(
            onRefresh: () => model.refresh(),
            child: InfiniteList(
              isLoading: model.isLoading,
              sliverHeader: widget.header,
              persistentHeaderBuilder: widget.persistentHeaderBuilder,
              sliverHeaderBuilder: widget.headerBuilder,
              loadData: () async {
                await model.loadMoreItems();
              },
              itemCount: model.items.length,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider<D>.value(
                  value: model.items[index],
                  child: widget.buildChildren(context),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
