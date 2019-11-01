import 'package:flutter/material.dart';
import 'package:owmflutter/models/link.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/month_picker.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/model/model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String upcomingSort = UpcomingSort.SORTBY_ACTIVE;
  int topSelectedMonth = DateTime.now().month;
  int topSelectedYear = DateTime.now().year;

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
              Tab(text: 'Główna'),
              Tab(text: 'Wykopalisko'),
              Tab(text: 'Hity'),
              Tab(text: 'Ulubione'),
            ],
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              LinksList(
                persistentHeaderBuilder: (context) => Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        SingleChildScrollView(
                          padding: EdgeInsets.symmetric(horizontal: 9.0),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              topIcon("Ciekawostki", "ciekawostki",
                                  Icons.lightbulb_outline),
                              topIcon("Nauka", "nauka", Icons.school),
                              topIcon(
                                  "Historia", "historia", Icons.calendar_today),
                              topIcon("Rozrywka", "rozrywka",
                                  Icons.videogame_asset),
                              topIcon("Sport", "sport", Icons.rowing),
                              topIcon("Motoryzacja", "motoryzacja",
                                  Icons.motorcycle),
                              topIcon("Syria", "syria", Icons.place),
                              topIcon("Świat", "swiat", Icons.public),
                              topIcon("SpaceX", "spacex", Icons.whatshot),
                              topIcon(
                                  "Programowanie", "programowanie", Icons.code),
                              topIcon("Technologia", "technologia",
                                  Icons.wifi_tethering),
                              topIcon("AMA", "ama", Icons.question_answer),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 18.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    colors: [
                                      Theme.of(context).primaryColor,
                                      Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.0),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 18.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    colors: [
                                      Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.0),
                                      Theme.of(context).primaryColor,
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    DividerWidget(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                    ),
                  ],
                ),
                builder: (context) => LinkListModel(
                  loadNewLinks: (page) => api.links.getPromotedNew(page),
                ),
              ),
              Container(
                key: ValueKey(upcomingSort),
                child: LinksList(
                  header: FloatingTabsHeader(
                    children: <Widget>[
                      TabButtonWidget(
                        text: "Aktywne",
                        fontSize: 13,
                        isSelected: upcomingSort == UpcomingSort.SORTBY_ACTIVE,
                        onTap: () => setState(
                            () => upcomingSort = UpcomingSort.SORTBY_ACTIVE),
                      ),
                      TabButtonWidget(
                        text: "Wykopywane",
                        fontSize: 13,
                        isSelected: upcomingSort == UpcomingSort.SORTBY_VOTES,
                        onTap: () => setState(
                            () => upcomingSort = UpcomingSort.SORTBY_VOTES),
                      ),
                      TabButtonWidget(
                        text: "Najnowsze",
                        fontSize: 13,
                        isSelected: upcomingSort == UpcomingSort.SORTBY_DATE,
                        onTap: () => setState(
                            () => upcomingSort = UpcomingSort.SORTBY_DATE),
                      ),
                      TabButtonWidget(
                        text: "Komentowane",
                        fontSize: 13,
                        isSelected:
                            upcomingSort == UpcomingSort.SORTBY_COMMENTS,
                        onTap: () => setState(
                            () => upcomingSort = UpcomingSort.SORTBY_COMMENTS),
                      ),
                    ],
                  ),
                  builder: (context) => LinkListModel(
                    loadNewLinks: (page) =>
                        api.links.getUpcoming(upcomingSort, page),
                  ),
                ),
              ),
              TopLinksScreen(),
              NotLoggedWidget(
                icon: Icons.favorite,
                text: "Ulubione znaleziska",
                child: LinksList(
                  builder: (context) => LinkListModel(
                    loadNewLinks: (page) => api.links.getFavoriteNew(page),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget topIcon(String title, String tag, IconData icon) {
    return GestureDetector(
      onTap: () =>
          Navigator.push(context, Utils.getPageTransition(TagScreen(tag: tag))),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 9.0),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Utils.backgroundGreyOpacity(context),
                shape: BoxShape.circle,
              ),
              margin:
                  EdgeInsets.only(left: 4.0, top: 2.0, right: 4.0, bottom: 6.0),
              padding: EdgeInsets.all(12.0),
              child: Icon(icon),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}

class TopLinksScreen extends StatefulWidget {
  @override
  _TopLinksScreenState createState() => _TopLinksScreenState();
}

class _TopLinksScreenState extends State<TopLinksScreen> {
  int selectedIndex = 0;
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(selectedIndex.toString() +
          selectedMonth.toString() +
          selectedYear.toString()),
      child: LinksList(
        header: FloatingTabsHeader(
          children: <Widget>[
            TabButtonWidget(
              text: "Popularne",
              fontSize: 12,
              index: 0,
              currentIndex: selectedIndex,
              onTap: () => setState(() => selectedIndex = 0),
            ),
            TabButtonWidget(
              text: "Dnia",
              fontSize: 12,
              index: 1,
              currentIndex: selectedIndex,
              onTap: () => setState(() => selectedIndex = 1),
            ),
            TabButtonWidget(
              text: "Tygodnia",
              index: 2,
              currentIndex: selectedIndex,
              fontSize: 12,
              onTap: () => setState(() => selectedIndex = 2),
            ),
            TabButtonWidget(
              text: "Miesiąca",
              fontSize: 12,
              index: 3,
              currentIndex: selectedIndex,
              onTap: () async {
                var selection = await showMonthPicker(
                  context: context,
                  firstDate: DateTime(2005, 12),
                  initialDate: DateTime(selectedYear, selectedMonth),
                  lastDate: DateTime.now(),
                );
                setState(() {
                  selectedMonth = selection.month;
                  selectedYear = selection.year;
                  selectedIndex = 3;
                });
              },
            ),
            TabButtonWidget(
              text: "Roku",
              fontSize: 12,
              index: 4,
              currentIndex: selectedIndex,
              onTap: () async {
                await showDialog(
                    context: context,
                    builder: (context) => GreatDialogWidget(
                          child: SizedBox(
                              height: 230,
                              width: 300,
                              child: YearPicker(
                                firstDate: DateTime(2006),
                                selectedDate: DateTime(selectedYear),
                                lastDate: DateTime.now(),
                                onChanged: (date) {
                                  setState(() {
                                    selectedYear = date.year;
                                    selectedIndex = 4;
                                  });
                                  Navigator.of(context).pop();
                                },
                              )),
                        ));
              },
            ),
          ],
        ),
        builder: (context) => LinkListModel(
          loadNewLinks: (page) => getCurrentLinkEndpoint(page),
        ),
      ),
    );
  }

  Future<List<Link>> getCurrentLinkEndpoint(int page) {
    if (selectedIndex == 0) {
      return api.links.getHitsDay(page);
    }
    if (selectedIndex == 1) {
      return api.links.getHitsPopular(page);
    }
    if (selectedIndex == 2) {
      return api.links.getHitsWeek(page);
    }
    if (selectedIndex == 3) {
      return api.links.getHitsMonth(page, selectedMonth, selectedYear);
    }
    return api.links.getHitsYear(page, selectedYear);
  }
}
