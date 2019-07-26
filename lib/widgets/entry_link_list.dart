import 'dart:async';
import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class EntriesLinksList extends StatefulWidget {
  final dynamic builder;
  final Widget header;

  EntriesLinksList({this.builder, this.header});

  @override
  EntriesLinksListState createState() {
    return new EntriesLinksListState();
  }
}

class EntriesLinksListState extends State<EntriesLinksList> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: ChangeNotifierProvider<EntryLinkListModel>(
        builder: widget.builder,
        child: Consumer<EntryLinkListModel>(
          builder: (context, model, _) => RefreshIndicator(
            onRefresh: () => model.refresh(),
            child: model.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : InfiniteList(
                    header: widget.header,
                    loadData: (completer) async {
                      await model.loadMoreEntryLinks();
                    },
                    itemCount: model.entryLinks.length,
                    itemBuilder: (context, index) {
                      if (model.entryLinks[index].hasEntry) {
                        return ListenableProvider<EntryModel>(
                          builder: (context) => EntryModel()
                            ..setData(model.entryLinks[index].entry),
                          child: NewEntryWidget(ellipsize: true),
                        );
                      } else {
                        return ListenableProvider<LinkModel>(
                          builder: (context) => LinkModel()
                            ..setData(model.entryLinks[index].link),
                          child: NewLinkWidget(),
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
