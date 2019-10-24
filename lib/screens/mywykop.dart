import 'package:flutter/material.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'package:provider/provider.dart';
import 'package:owmflutter/utils/utils.dart';

class MyWykopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShadowControlModel>(
      builder: (context) => ShadowControlModel(),
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppbarTabsWidget(
            tabs: <Widget>[
              Tab(text: 'Mój Wykop'),
              Tab(text: 'Tagi'),
              Tab(text: 'Użytkownicy'),
              Tab(text: 'Lista tagów'),
            ],
          ),
          body: TabBarView(
            children: [
              NotLoggedWidget(
                icon: Icons.loyalty,
                fullText: "Mój wykop będzie widoczny po zalogowaniu.",
                child: EntriesLinksList(
                  builder: (context) => EntryLinkListmodel(
                    loadNewEntryLinks: (page) => api.mywykop.getIndex(page),
                  ),
                ),
              ),
              NotLoggedWidget(
                icon: OwmGlyphs.ic_navi_my_wykop,
                fullText:
                    "Aktywność z obserwowanych tagów będzie widoczna po zalogowaniu.",
                child: EntriesLinksList(
                  builder: (context) => EntryLinkListmodel(
                    loadNewEntryLinks: (page) => api.mywykop.getTags(page),
                  ),
                ),
              ),
              NotLoggedWidget(
                icon: Icons.group,
                fullText:
                    "Aktywność obserwowanych użytkowników będzie widoczna po zalogowaniu.",
                child: EntriesLinksList(
                  builder: (context) => EntryLinkListmodel(
                    loadNewEntryLinks: (page) => api.mywykop.getUsers(page),
                  ),
                ),
              ),
              NotLoggedWidget(
                icon: Icons.list,
                text: "Obserwowane tagi",
                child: _drawObservedTags(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawObservedTags() {
    return ChangeNotifierProvider(
      builder: (context) => ObservedTagsModel()..loadObservedTags(),
      child: Consumer<ObservedTagsModel>(
        builder: (context, model, _) {
          if (model.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: model.tags.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.of(context).push(
                  Utils.getPageTransition(
                    TagScreen(
                      tag: model.tags[index].replaceFirst("#", ""),
                    ),
                  ),
                );
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                child: Text(
                  model.tags[index],
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
