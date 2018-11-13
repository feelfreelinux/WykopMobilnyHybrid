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
          leading: IconButton(
            icon: Icon(OwmGlyphs.ic_navi_profile),
            onPressed: () {},
          ),
          titleSpacing: 0.0,
          centerTitle: true,
          elevation: 2.5,
          title: Text('Mikroblog'),
          actions: <Widget>[
            IconButton(
              icon: Icon(OwmGlyphs.ic_refresh),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(OwmGlyphs.ic_navi_search),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
            decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
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
                    return () => store.dispatch(LoadHotAction());
                  }, builder: (context, callback) {
                    return InfiniteList(
                        isLoading: state.listState.isLoading &&
                            state.listState.haveReachedEnd,
                        loadData: callback,
                        itemCount: state.entriesIds.length,
                        itemBuilder: (context, index) {
                          return EntryWidget(
                              entry: state.entries[state.entriesIds[index]],
                              ellipsize: true);
                        });
                  });
                })),
        floatingActionButton: FloatingActionButton(
          child: const Icon(OwmGlyphs.ic_pen),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(OwmGlyphs.ic_navi_links),
              title: Text('Znaleziska', style: TextStyle(fontSize: 11.0)),
            ),
            BottomNavigationBarItem(
              icon: Icon(OwmGlyphs.ic_navi_my_wykop),
              title: Text('Mój Wykop', style: TextStyle(fontSize: 11.0)),
            ),
            BottomNavigationBarItem(
              icon: Icon(OwmGlyphs.ic_navi_mirkoblog),
              title: Text('Mikroblog', style: TextStyle(fontSize: 11.0)),
            ),
            BottomNavigationBarItem(
              icon: Icon(OwmGlyphs.ic_navi_favourite),
              title: Text('Ulubione', style: TextStyle(fontSize: 11.0)),
            ),
            BottomNavigationBarItem(
              icon: Icon(OwmGlyphs.ic_navi_messages),
              title: Text('Wiadomości', style: TextStyle(fontSize: 11.0)),
            ),
          ],
        ));
  }
}
