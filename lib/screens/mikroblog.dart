import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/owm_glyphs.dart';

class HotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              child: Padding(
            padding: EdgeInsets.all(10.0),
            child: new Container(
                width: 1,
                height: 1,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(
                            "https://www.wykop.pl/cdn/c3397992/avatar_def,q80.png")))),
          )),
          titleSpacing: 0.0,
          centerTitle: true,
          elevation: 1.5,
          title: Text('Mikroblog'),
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
        ),
        body: Container(
            decoration:
                new BoxDecoration(color: Theme.of(context).backgroundColor),
            child: StoreConnector<AppState, MikroblogState>(
                converter: (store) => store.state.mikroblogState,
                onInit: (store) {
                  store.dispatch(loadHotPeriod("12"));
                },
                builder: (context, state) {
                  if (state.listState.isLoading && state.listState.page == 1) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return StoreConnector<AppState, VoidCallback>(
                      converter: (store) {
                    return () => store.dispatch(loadHotPeriod("12"));
                  }, builder: (context, callback) {
                    return InfiniteList(
                        isLoading: state.listState.isLoading && state.listState.haveReachedEnd,
                        loadData: callback,
                        itemCount: state.entriesIds.length,
                        itemBuilder: (context, index) {
                          return EntryWidget(
                              entry: state.entries[state.entriesIds[index]],
                              ellipsize: true);
                        });
                  });
                })),
        floatingActionButton: new FloatingActionButton(
          child: const Icon(OwmGlyphs.ic_pen),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: BottomAppBar(
            child: new Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(OwmGlyphs.ic_navi_links),
                onPressed: () {},
                color: Color(0xff666666),
              ),
              IconButton(
                icon: Icon(OwmGlyphs.ic_navi_my_wykop),
                onPressed: () {},
                color: Color(0xff666666),
              ),
              IconButton(
                icon: Icon(OwmGlyphs.ic_navi_mirkoblog),
                onPressed: () {},
                color: Color(0xff3c84c1),
              ),
              IconButton(
                icon: Icon(OwmGlyphs.ic_navi_favourite),
                onPressed: () {},
                color: Color(0xff666666),
              ),
              IconButton(
                icon: Icon(OwmGlyphs.ic_navi_messages),
                onPressed: () {},
                color: Color(0xff666666),
              ),
            ],
          ),
        )));
  }
}
