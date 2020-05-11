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
      create: (context) => ShadowControlModel(scrollDelayPixels: 0),
      child: DefaultTabController(
        length: 4,
        initialIndex:
            Provider.of<OWMSettings>(context, listen: false).defaultLinkScreen,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppbarTabsWidget(
            tabs: <Widget>[
              GestureDetector(child: Tab(text: 'Główna')),
              Tab(text: 'Wykopalisko'),
              Tab(text: 'Hity'),
              Tab(text: 'Ulubione'),
            ],
          ),
          body: TabBarView(
            children: [
              LinksList(
                header: FloatingTabsHeader(
                  size: 89,
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: 9.0),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            topIcon("Ciekawostki", "ciekawostki",
                                Icons.lightbulb_outline),
                            topIcon("Nauka", "nauka", Icons.school),
                            topIcon(
                                "Historia", "historia", Icons.calendar_today),
                            topIcon(
                                "Rozrywka", "rozrywka", Icons.videogame_asset),
                            topIcon("Sport", "sport", Icons.rowing),
                            topIcon(
                                "Motoryzacja", "motoryzacja", Icons.motorcycle),
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
                    ),
                  ],
                ),
                builder: (context) => LinkListModel(
                  context: context,
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
                        isSelected: upcomingSort == UpcomingSort.SORTBY_ACTIVE,
                        onTap: () => setState(
                            () => upcomingSort = UpcomingSort.SORTBY_ACTIVE),
                      ),
                      TabButtonWidget(
                        text: "Wykopywane",
                        isSelected: upcomingSort == UpcomingSort.SORTBY_VOTES,
                        onTap: () => setState(
                            () => upcomingSort = UpcomingSort.SORTBY_VOTES),
                      ),
                      TabButtonWidget(
                        text: "Najnowsze",
                        isSelected: upcomingSort == UpcomingSort.SORTBY_DATE,
                        onTap: () => setState(
                            () => upcomingSort = UpcomingSort.SORTBY_DATE),
                      ),
                      TabButtonWidget(
                        text: "Komentowane",
                        isSelected:
                            upcomingSort == UpcomingSort.SORTBY_COMMENTS,
                        onTap: () => setState(
                            () => upcomingSort = UpcomingSort.SORTBY_COMMENTS),
                      ),
                    ],
                  ),
                  builder: (context) => LinkListModel(
                    context: context,
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
                    context: context,
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
          Navigator.push(context, Utils.getPageSlideToUp(TagScreen(tag: tag))),
      child: Container(
        padding: EdgeInsets.fromLTRB(9.0, 8.0, 9.0, 12.0),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Utils.backgroundGreyOpacity(context),
                shape: BoxShape.circle,
              ),
              margin: EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 6.0),
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
              index: 0,
              currentIndex: selectedIndex,
              onTap: () => setState(() => selectedIndex = 0),
            ),
            TabButtonWidget(
              text: "Dnia",
              index: 1,
              currentIndex: selectedIndex,
              onTap: () => setState(() => selectedIndex = 1),
            ),
            TabButtonWidget(
              text: "Tygodnia",
              index: 2,
              currentIndex: selectedIndex,
              onTap: () => setState(() => selectedIndex = 2),
            ),
            TabButtonWidget(
              text: "Miesiąca",
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
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        builder: (context) => LinkListModel(
            context: context,
            loadNewLinks: (page) => getCurrentLinkEndpoint(page)),
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
