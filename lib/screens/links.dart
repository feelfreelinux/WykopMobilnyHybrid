import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/owm_glyphs.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
            leading: AppbarUserWidget(),
            titleSpacing: 0.0,
            centerTitle: true,
            elevation: 1.5,
            title: Text('Główna'),
            actions: <Widget>[
              IconButton(
                icon: Icon(OwmGlyphs.ic_navi_search),
                onPressed: () {},
                tooltip: "Szukaj",
              ),
              IconButton(
                icon: Icon(OwmGlyphs.ic_refresh),
                onPressed: () {},
                tooltip: "Odśwież",
              )
            ],
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: 'Główna'),
              ],
            )),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            LinksList(
                converterCallback: (store) =>
                    store.state.linksState.promotedState,
                loadDataCallback: (store, refresh) =>
                    store.dispatch(loadPromoted())),
          ],
        ),
      ),
    );
  }
}
