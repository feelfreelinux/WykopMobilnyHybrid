import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/model/link_model.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/link/votes_buttons.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:provider/provider.dart';
import 'vote_counter.dart';
import 'package:owmflutter/owm_glyphs.dart';

class LinkOpenedWidget extends StatefulWidget {
  @override
  _LinkOpenedWidgetState createState() => _LinkOpenedWidgetState();
}

class _LinkOpenedWidgetState extends State<LinkOpenedWidget> {
  bool showButtonsState = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<LinkModel>(
      builder: (context, model, _) => Material(
        key: Key(model.id.toString()),
        color: Theme.of(context).cardColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
              ),
              child: Stack(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: AuthorWidget(
                          author: model.author,
                          date: model.date,
                          fontSize: 15.0,
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                        ),
                      ),
                      VoteCounterWidget(
                        voteState: model.voteState,
                        onTap: () {
                          if (model.voteState != LinkVoteState.NONE) {
                            model.voteRemove();
                            return;
                          }
                          setState(() {
                            showButtonsState = !showButtonsState;
                          });
                        },
                        count: model.voteCount,
                        size: 48.0,
                        isHot: model.isHot,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                        ),
                      ),
                    ],
                  ),
                  VotesButtonsWidget(
                    showButtonsState: showButtonsState,
                    onTapUpVote: () {
                      model.voteUp();
                      setState(() => showButtonsState = false);
                    },
                    onTapDownVote: () {
                      showDialog(
                        context: context,
                        builder: (context) => BuryReasonDialog(
                          callback: (reason) => model.voteDown(reason),
                        ),
                      );

                      setState(() => showButtonsState = false);
                    },
                  ),
                ],
              ),
            ),
            Consumer<LinkModel>(
              builder: (context, model, _) => GestureDetector(
                onTap: () => Utils.launchURL(model.sourceUrl, context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Stack(
                      children: [
                        _drawImage(context, model.preview),
                        const _LinkFavicon(),
                      ],
                    ),
                    _drawTitle(context, model.title),
                    new _LinkDescriptionWidget(description: model.description),
                  ],
                ),
              ),
            ),
            const _LinkTagsWidget(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 18.0,
              ),
              child: Consumer<LinkModel>(
                builder: (context, model, _) =>
                    LinkFooterWidget(link: model, isClickable: false),
              ),
            ),
            DividerWidget(
              padding: EdgeInsets.symmetric(
                horizontal: 18.0,
              ),
            ),
            new _LinkRelatedWidget(context: context),
            DividerWidget(
              padding: EdgeInsets.symmetric(
                horizontal: 18.0,
              ),
            ),
            _LinkCommentHeader(),
          ],
        ),
      ),
    );
  }

  Widget _drawImage(BuildContext context, String preview) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Color(0x33000000))],
        image: DecorationImage(
          image: AdvancedNetworkImage(
            preview != null
                ? preview
                : 'https://www.wykop.pl/cdn/c2526412/no-picture-night.jpg',
            useDiskCache: true,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _drawTitle(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.only(
        left: 18.0,
        top: 12.0,
        right: 18.0,
      ),
      child: Text(
        title,
        style: TextStyle(
          height: 1.1,
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _LinkFavicon extends StatelessWidget {
  const _LinkFavicon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: Container(
        margin: const EdgeInsets.all(12.0),
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor.withOpacity(0.8),
          border: Border.all(
            color: const Color(0x337f7f7f),
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Consumer<LinkModel>(
                builder: (context, model, _) => Image(
                  image: AdvancedNetworkImage(
                    'http://s2.googleusercontent.com/s2/favicons?domain_url=' +
                        model.sourceUrl,
                    useDiskCache: false,
                  ),
                  height: 10.0,
                  width: 10.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4.0,
              ),
              child: Consumer<LinkModel>(
                builder: (context, model, _) => Text(
                  model.sourceUrl
                      .replaceAll('https://', '')
                      .replaceAll('http://', '')
                      .replaceAll('www.', '')
                      .split('/')[0],
                  style: const TextStyle(
                    fontSize: 11.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LinkRelatedWidget extends StatelessWidget {
  const _LinkRelatedWidget({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
            vertical: 14.0,
          ),
          child: Row(
            children: <Widget>[
              Consumer<LinkModel>(
                builder: (context, link, _) => Text(
                  link.relatedCount.toString(),
                  style: const TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Consumer<LinkModel>(
                builder: (context, link, _) => Text(
                  " " +
                      Utils.polishPlural(
                        count: link.relatedCount,
                        first: "Powiązany",
                        many: "Powiązanych",
                        other: "Powiązane",
                      ),
                  style: const TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(child: Container()),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 10.0,
                  ),
                  child: const Text(
                    "Dodaj link",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                onTap: () {
                  //TODO add a related add screen
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Niezaimplementowano'),
                  ));
                },
              ),
            ],
          ),
        ),
        Consumer<LinkModel>(
          builder: (context, link, _) => Padding(
            padding: const EdgeInsets.only(
              bottom: 18.0,
            ),
            child: link.relatedCount > 0
                ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      child: Row(
                        children: link.relatedLinks
                            .map((id) => RelatedWidget(
                                  related: id,
                                  count: link.relatedCount,
                                ))
                            .toList(),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18.0,
                    ),
                    child: const Text(
                      "Brak linków powiązanych ze znaleziskiem.",
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}

class _LinkDescriptionWidget extends StatelessWidget {
  const _LinkDescriptionWidget({
    Key key,
    @required this.description,
  }) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 18.0,
        top: 10.0,
        right: 18.0,
      ),
      child: Text(
        description,
        style: const TextStyle(
          height: 1.1,
        ),
      ),
    );
  }
}

class _LinkTagsWidget extends StatelessWidget {
  const _LinkTagsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LinkModel>(
      builder: (context, model, _) => Padding(
        padding: const EdgeInsets.only(
          left: 18.0,
          top: 10.0,
          right: 18.0,
        ),
        child: Text(
          model.tags,
          style: const TextStyle(
            height: 1.1,
          ),
        ),
      ),
    );
  }
}

class _LinkCommentHeader extends StatelessWidget {
  const _LinkCommentHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 18.0,
        top: 14.0,
        right: 18.0,
        bottom: 2.0,
      ),
      child: Row(
        children: <Widget>[
          Consumer<LinkModel>(
            builder: (context, link, _) => Text(
              link.commentsCount.toString(),
              style: const TextStyle(
                fontSize: 16.5,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Consumer<LinkModel>(
            builder: (context, link, _) => Text(
              " " +
                  Utils.polishPlural(
                    count: link.commentsCount,
                    first: "Komentarz",
                    many: "Komentarzy",
                    other: "Komentarze",
                  ),
              style: const TextStyle(
                fontSize: 16.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(child: Container()),
          GestureDetector(
            child: const Icon(
              OwmGlyphs.ic_sort,
            ),
            onTap: () {
              //TODO add sorting comments
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Niezaimplementowano'),
              ));
            },
          ),
        ],
      ),
    );
  }
}
