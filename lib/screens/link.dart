import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/keys.dart';
import 'dart:async';

class LinkScreen extends StatefulWidget {
  final int linkId;

  LinkScreen({Key key, @required this.linkId}) : super(key: key);

  List<String> _getComments(List<List<dynamic>> comments) {
    var ids = List<String>.from([]);
    comments.forEach((e) {
      ids
        ..add('top_' + e.first.toString())
        ..addAll(e
            .sublist(1, e.length)
            .map((d) => 'child_' + d.toString())
            .toList());
    });
    return ids;
  }

  _LinkScreenState createState() => _LinkScreenState();
}

class _LinkScreenState extends State<LinkScreen>
    with SingleTickerProviderStateMixin {
  bool appbarShadow = false;
  bool inputShadow = true;

  _appbarShadow(bool visible) {
    if (visible != appbarShadow)
      setState(() {
        appbarShadow = visible;
      });
  }

  _inputShadow(bool visible) {
    if (visible != inputShadow)
      setState(() {
        inputShadow = visible;
      });
  }

  bool hideChild = true;

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);
    final linkId = widget.linkId;

    return _SystemPadding(
      child: MediaQuery(
        data: mqDataNew,
        child: Scaffold(
          bottomNavigationBar: StoreConnector<AppState, dynamic>(
            converter: (store) =>
                (Completer completer, InputData inputData) => {},
            builder: (context, callback) => InputBarWidget(
              (inputData) {
                var completer = Completer();
                callback(completer, inputData);
                return completer.future;
              },
              shadow: inputShadow,
              key: OwmKeys.inputBarKey,
            ),
          ),
          resizeToAvoidBottomPadding: false,
          appBar: AppbarNormalWidget(
            shadow: appbarShadow,
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
          body: Container(
            decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
            child: StoreConnector<AppState, dynamic>(
              converter: (store) => (completer) =>
                  store.dispatch(loadLinkComments(linkId, completer)),
              builder: (context, callback) =>
                  StoreConnector<AppState, List<List<dynamic>>>(
                converter: (store) =>
                    store.state.linkScreensState?.states[linkId.toString()]
                        ?.comments ??
                    [],
                onInit: (store) {
                  store.dispatch(loadLinkComments(linkId, Completer()));
                },
                builder: (context, ids) {
                  var commentIds = widget._getComments(ids);
                  return RefreshIndicator(
                    onRefresh: () {
                      var completer = new Completer();
                      callback(completer);
                      return completer.future;
                    },
                    child: ScrollConfiguration(
                      behavior: NotSuddenJumpScrollBehavior(),
                      child: ErrorHandlerWidget(
                        errorType: LINK_PREFIX + linkId.toString(),
                        errorStateConverter: (store) =>
                            store.state.linkScreensState
                                ?.states[linkId.toString()]?.errorState ??
                            ErrorState(),
                        hasData: () => commentIds.isNotEmpty,
                        child: NotificationListener<ScrollNotification>(
                          onNotification: (scrollNotification) {
                            if (scrollNotification
                                is ScrollUpdateNotification) {
                              if (scrollNotification.metrics.pixels <
                                  scrollNotification.metrics.maxScrollExtent) {
                                _appbarShadow(true);
                                _inputShadow(true);
                              }
                              if (scrollNotification.metrics.pixels >=
                                  scrollNotification.metrics.maxScrollExtent) {
                                _inputShadow(false);
                              }
                              if (scrollNotification.metrics.pixels <=
                                  scrollNotification.metrics.minScrollExtent) {
                                _appbarShadow(false);
                              }
                            }
                            return;
                          },
                          child: ListView.builder(
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount: commentIds.length + 1,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return LinkOpenedWidget(linkId: linkId);
                              } else {
                                // TODO: Rewrite this sick piece of code. It works tho
                                return LinkCommentWidget(
                                  isFirst:
                                      commentIds[index - 1].startsWith('top_'),
                                  isLast: ids.firstWhere((e) =>
                                          e.contains(int.parse(commentIds[index - 1].split('_')[1])))[ids
                                              .firstWhere((e) => e.contains(
                                                  int.parse(
                                                      commentIds[index - 1]
                                                          .split('_')[1])))
                                              .length -
                                          1] ==
                                      int.parse(commentIds[index - 1].split('_')[1]),
                                  commentId: int.parse(
                                      commentIds[index - 1].split('_')[1]),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
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
