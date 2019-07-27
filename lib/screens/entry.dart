import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/keys.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class EntryScreen extends StatefulWidget {
  final EntryModel model;
  final int entryId;

  EntryScreen({Key key, this.model, this.entryId}) : super(key: key);

  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);

    return ChangeNotifierProvider.value(
      value: (widget.model ?? (EntryModel()..setId(widget.entryId))
        ..updateEntry()),
      child: ChangeNotifierProvider<ShadowControlModel>(
        builder: (context) => ShadowControlModel(),
        child: Consumer<EntryModel>(
          builder: (context, model, _) => model.isLoading && model.body == null
              ? Center(child: CircularProgressIndicator())
              : _SystemPadding(
                  child: MediaQuery(
                    data: mqDataNew,
                    child: Scaffold(
                      backgroundColor: Theme.of(context).backgroundColor,
                      bottomNavigationBar: InputBarWidget(
                        (inputData) {},
                        key: OwmKeys.inputBarKey,
                      ),
                      resizeToAvoidBottomPadding: false,
                      appBar: AppbarNormalWidget(
                        padding: EdgeInsets.only(right: 8.0),
                        actions: <Widget>[
                          AppBarButton(
                            icon: Icons.refresh,
                            round: true,
                          ),
                          AppBarButton(
                            icon: Icons.more_vert,
                            round: true,
                          )
                        ],
                      ),
                      body: RefreshIndicator(
                        onRefresh: () {
                          return model.updateEntry();
                        },
                        child: ScrollConfiguration(
                          behavior: NotSuddenJumpScrollBehavior(),
                          child: InfiniteList(
                            header: NewEntryWidget(ellipsize: false),
                            itemCount: model.comments.length,
                            itemBuilder: (context, index) =>
                                ChangeNotifierProvider<EntryCommentModel>(
                              builder: (context) => EntryCommentModel()
                                ..setData(model.comments[index]),
                              child: EntryCommentWidget(),
                            ),
                            loadData: (page) => {},
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return new AnimatedContainer(
      padding: mediaQuery.viewInsets,
      duration: Duration(milliseconds: 150),
      child: child,
    );
  }
}
