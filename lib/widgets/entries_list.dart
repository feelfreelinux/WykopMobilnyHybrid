import 'dart:async';
import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class EntriesList extends StatefulWidget {
  final dynamic builder;
  final Widget header;

  EntriesList({this.builder, this.header});

  @override
  EntriesListState createState() {
    return new EntriesListState();
  }
}

class EntriesListState extends State<EntriesList> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
 
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: ChangeNotifierProvider<EntryListModel>(
        builder: widget.builder,
        child: Consumer<EntryListModel>(
          builder: (context, model, _) => RefreshIndicator(
            onRefresh: () => model.refresh(),
            child: model.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : InfiniteList(
                    header: widget.header,
                    loadData: (completer) async {
                      await model.loadMoreEntries();
                    },
                    itemCount: model.entries.length,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider<EntryModel>.value(
                        value: model.entries[index],
                        child: NewEntryWidget(ellipsize: true),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
