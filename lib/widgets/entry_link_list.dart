import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class EntriesLinksList extends StatefulWidget {
  final dynamic builder;
  final Widget header;
  final WidgetBuilder persistentHeaderBuilder;

  EntriesLinksList({
    this.builder,
    this.header,
    this.persistentHeaderBuilder,
  });

  @override
  EntriesLinksListState createState() {
    return new EntriesLinksListState();
  }
}

class EntriesLinksListState extends State<EntriesLinksList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: ChangeNotifierProvider<EntryLinkListmodel>(
        create: widget.builder,
        child: Consumer<EntryLinkListmodel>(
          builder: (context, model, _) => RefreshIndicator(
            onRefresh: () => model.refresh(),
            child: InfiniteList(
              isLoading: model.isLoading,
              sliverHeader: widget.header,
              persistentHeaderBuilder: widget.persistentHeaderBuilder,
              loadData: () async {
                await model.loadMoreItems();
              },
              itemCount: model.items.length,
              itemBuilder: (context, index) {
                if (model.items[index] is EntryModel) {
                  return ListenableProvider<EntryModel>.value(
                    value: model.items[index],
                    child: EntryWidget(ellipsize: true),
                  );
                } else {
                  return ListenableProvider<LinkModel>.value(
                    value: model.items[index],
                    child: LinkWidget(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
