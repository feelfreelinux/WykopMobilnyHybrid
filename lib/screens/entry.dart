import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/models/author.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class EntryScreen extends StatefulWidget {
  final EntryModel model;
  final int entryId;

  EntryScreen({Key key, this.model, this.entryId}) : super(key: key);

  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen>
    with SingleTickerProviderStateMixin {
  EntryModel _entryModel;
  GlobalKey<RefreshIndicatorState> refreshIndicatorKey = GlobalKey();

  @override
  void initState() {
    _entryModel = (widget.model ?? (EntryModel()..setId(widget.entryId))
      ..updateEntry()
      ..loadUpVoters());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 1.0);

    return ChangeNotifierProvider<EntryModel>.value(
      value: _entryModel,
      child: ChangeNotifierProvider<ShadowControlModel>(
        create: (context) => ShadowControlModel(),
        child: Consumer<EntryModel>(
          builder: (context, model, _) =>
              ChangeNotifierProvider<InputModel>.value(
            value: model,
            child: model.isLoading && model.body == null
                ? Center(child: CircularProgressIndicator())
                : _SystemPadding(
                    child: MediaQuery(
                      data: mqDataNew,
                      child: Scaffold(
                        backgroundColor: Theme.of(context).backgroundColor,
                        bottomNavigationBar: InputBarWidget(
                          isLinkScreen: true,
                          key: model.inputBarKey,
                        ),
                        resizeToAvoidBottomPadding: false,
                        appBar: AppbarNormalWidget(
                          leading: RoundIconButtonWidget(
                            icon: Icons.keyboard_backspace,
                            iconSize: 26.0,
                            onTap: () => Navigator.of(context).pop(),
                            padding: EdgeInsets.fromLTRB(8.0, 0.0, 16.0, 0.0),
                            iconPadding:
                                EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                          ),
                          center: Consumer<ShadowControlModel>(
                            builder: (context, shadowControlModel, _) =>
                                AnimatedOpacity(
                              opacity:
                                  shadowControlModel.showTopShadow ? 0.0 : 1.0,
                              duration: Duration(milliseconds: 300),
                              child: AuthorWidget(
                                avatarSize: 36.0,
                                author: Author.fromAuthState(
                                  username: model.author.login,
                                  avatarUrl: model.author.avatar,
                                  color: model.author.color,
                                  sex: model.author.sex,
                                ),
                                date: model.date,
                                fontSize: 16.0,
                                padding: EdgeInsets.all(0),
                              ),
                            ),
                          ),
                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          actions: <Widget>[
                            RoundIconButtonWidget(
                              icon: model.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              iconColor: model.isFavorite ? Colors.red : null,
                              padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                              iconPadding:
                                  EdgeInsets.fromLTRB(6.0, 7.0, 6.0, 5.0),
                              onTap: () => model.favoriteToggle(),
                            ),
                            RoundIconButtonWidget(
                              iconSize: 22.0,
                              icon: Icons.share,
                              padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
                              iconPadding:
                                  EdgeInsets.fromLTRB(6.0, 7.0, 8.0, 7.0),
                              onTap: () => Share.share(
                                  "https://www.wykop.pl/wpis/" +
                                      model.id.toString()),
                            ),
                            RoundIconButtonWidget(
                              iconSize: 26.0,
                              icon: Icons.refresh,
                              padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                              iconPadding:
                                  EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                              onTap: () =>
                                  refreshIndicatorKey.currentState.show(),
                            )
                          ],
                        ),
                        body: RefreshIndicator(
                          key: refreshIndicatorKey,
                          onRefresh: () async {
                            await model.updateEntry();
                            await model.loadUpVoters();
                          },
                          child: ScrollConfiguration(
                            behavior: NotSuddenJumpScrollBehavior(),
                            child: InfiniteList(
                              persistentHeaderBuilder: (context) => Column(
                                children: <Widget>[
                                  EntryOpenWidget(),
                                  NoCommentsWidget(model.comments.length == 0)
                                ],
                              ),
                              itemCount: model.comments.length,
                              itemBuilder: (context, index) =>
                                  ChangeNotifierProvider<
                                      EntryCommentModel>.value(
                                value: model.comments[index],
                                child: AuthorRelationBuilder(
                                  relationType: RelationType.ENTRY_COMMENTS,
                                  builder: (context, relation) =>
                                      EntryCommentWidget(
                                    entryId: model.id,
                                    relation: relation,
                                  ),
                                ),
                              ),
                              loadData: () async {
                                return;
                              },
                            ),
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
