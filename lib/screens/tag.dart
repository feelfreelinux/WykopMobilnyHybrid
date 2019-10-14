import 'package:flutter/material.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:provider/provider.dart';

class TagScreen extends StatefulWidget {
  final String tag;
  TagScreen({this.tag});
  @override
  _MainCollapsingToolbarState createState() => _MainCollapsingToolbarState();
}

class _MainCollapsingToolbarState extends State<TagScreen> {
  int screenIndex = 0;
  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 1);
    return ChangeNotifierProvider<TagModel>(
      builder: (context) => TagModel(widget.tag)..loadMeta(),
      child: Container(
        child: ChangeNotifierProvider<ShadowControlModel>(
          builder: (context) => ShadowControlModel(),
          child: MediaQuery(
            data: mqDataNew,
            child: Scaffold(
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.edit),
                onPressed: () {},
              ),
              body: SafeArea(
                child: _drawBody(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawEntries() {
    return EntriesList(
      persistentHeaderBuilder: (context) => _drawHeader(),
      header: _drawFloatingHeader(),
      builder: (context) => EntryListModel(
        loadNewEntries: (page) => api.tags.getEntries(widget.tag, page),
      ),
    );
  }

  Widget _drawLinks() {
    return LinksList(
      persistentHeaderBuilder: (context) => _drawHeader(),
      header: _drawFloatingHeader(),
      builder: (context) => LinkListModel(
        loadNewLinks: (page) => api.tags.getLinks(widget.tag, page),
      ),
    );
  }

  Widget _drawIndex() {
    return EntriesLinksList(
      persistentHeaderBuilder: (context) => _drawHeader(),
      header: _drawFloatingHeader(),
      builder: (context) => EntryLinkListmodel(
        loadNewEntryLinks: (page) => api.tags.getIndex(widget.tag, page),
      ),
    );
  }

  Widget _drawBody() {
    switch (screenIndex) {
      case 0:
        return _drawIndex();
        break;
      case 1:
        return _drawLinks();
        break;
      default:
        return _drawEntries();
    }
  }

  void _showDialogWithBody(TagModel model) {
    showDialog(
        context: context,
        builder: (context) => GreatDialogWidget(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Opis tagu', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  child: HtmlWidget(
                    textColor: Theme.of(context).textTheme.body1.color,
                    linkColor: Theme.of(context).accentColor,
                    textSize: 14,
                    html: model.description,
                    //TODO: Jakoś lepiej liczyć i ciąć tekst bo łapie html ^^^
                  ),
                ),
              )
            ])));
  }

  Widget _drawFloatingHeader() {
    return FloatingTabsHeader(
      children: <Widget>[
        TabButtonWidget(
          text: "Wszystko",
          index: 0,
          currentIndex: screenIndex,
          onTap: () => setState(() => screenIndex = 0),
        ),
        TabButtonWidget(
          text: "Znaleziska",
          index: 1,
          currentIndex: screenIndex,
          onTap: () => setState(() => screenIndex = 1),
        ),
        TabButtonWidget(
          text: "Wpisy",
          index: 2,
          currentIndex: screenIndex,
          onTap: () => setState(() => screenIndex = 2),
        ),
      ],
    );
  }

  Widget _drawHeader() {
    return Consumer<TagModel>(
      builder: (context, tagModel, _) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          image: tagModel.backgroundUrl != null
              ? DecorationImage(
                  image: AdvancedNetworkImage(tagModel.backgroundUrl),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8),
              child: RoundIconButtonWidget(
                roundColor: Colors.black.withOpacity(0.4),
                iconColor: Colors.white.withOpacity(0.5),
                icon: Icons.arrow_back,
                onTap: () => Navigator.of(context).pop(),
                iconSize: 26.0,
                iconPadding: EdgeInsets.all(5.0),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _showDialogWithBody(tagModel),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 16, bottom: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                "#" + widget.tag,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Text(
                              tagModel.subHeader,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RoundIconButtonWidget(
                        padding: EdgeInsets.only(left: 8, right: 16, bottom: 8),
                        roundColor: Colors.black.withOpacity(0.4),
                        iconColor: Colors.white.withOpacity(0.5),
                        icon: Icons.lock,
                        onTap: () => Navigator.of(context).pop(),
                        iconSize: 22.0,
                        iconPadding: EdgeInsets.all(5.0),
                      ),
                      RoundIconButtonWidget(
                        padding: EdgeInsets.only(left: 8, right: 16),
                        roundColor: Colors.black.withOpacity(0.4),
                        iconColor: Colors.white.withOpacity(0.5),
                        icon: Icons.remove_red_eye,
                        onTap: () => Navigator.of(context).pop(),
                        iconSize: 22.0,
                        iconPadding: EdgeInsets.all(5.0),
                      )
                    ],
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
/*

HtmlWidget(
                              textColor: Colors.white.withOpacity(0.7),
                              linkColor: Theme.of(context).accentColor,
                              textSize: 13,
                              html: tagModel.description.length > 180
                                  ? tagModel.description.substring(0, 180) +
                                      '...'
                                  : tagModel.description,
                              //TODO: Jakoś lepiej liczyć i ciąć tekst bo łapie html ^^^
                            ),*/
