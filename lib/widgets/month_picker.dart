import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

String numToPolishMonth(int month) {
  const months = [
    'Sty',
    'Lut',
    'Mar',
    'Kwi',
    'Maj',
    'Cze',
    'Lip',
    'Sier',
    'Wrz',
    'Paź',
    'Lis',
    'Gru'
  ];
  return months[month - 1];
}

/// Displays month picker dialog.
/// [initialDate] is the initially selected month.
/// [firstDate] is the optional lower bound for month selection.
/// [lastDate] is the optional upper bound for month selection.
Future<DateTime> showMonthPicker({
  @required BuildContext context,
  @required DateTime initialDate,
  DateTime firstDate,
  DateTime lastDate,
}) async {
  assert(context != null);
  assert(initialDate != null);
  return await showDialog<DateTime>(
    context: context,
    builder: (context) => _MonthPickerDialog(
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    ),
  );
}

class _MonthPickerDialog extends StatefulWidget {
  final DateTime initialDate, firstDate, lastDate;

  const _MonthPickerDialog({
    Key key,
    @required this.initialDate,
    this.firstDate,
    this.lastDate,
  }) : super(key: key);

  @override
  _MonthPickerDialogState createState() => _MonthPickerDialogState();
}

class _MonthPickerDialogState extends State<_MonthPickerDialog> {
  final GlobalKey<YearSelectorState> _yearSelectorState = new GlobalKey();
  final GlobalKey<MonthSelectorState> _monthSelectorState = new GlobalKey();

  PublishSubject<UpDownPageLimit> _upDownPageLimitPublishSubject;
  PublishSubject<UpDownButtonEnableState>
      _upDownButtonEnableStatePublishSubject;

  Widget _selector;
  DateTime selectedDate, _firstDate, _lastDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime(widget.initialDate.year, widget.initialDate.month);
    if (widget.firstDate != null)
      _firstDate = DateTime(widget.firstDate.year, widget.firstDate.month);
    if (widget.lastDate != null)
      _lastDate = DateTime(widget.lastDate.year, widget.lastDate.month);

    _upDownPageLimitPublishSubject = new PublishSubject();
    _upDownButtonEnableStatePublishSubject = new PublishSubject();

    _selector = new MonthSelector(
      key: _monthSelectorState,
      openDate: selectedDate,
      selectedDate: selectedDate,
      upDownPageLimitPublishSubject: _upDownPageLimitPublishSubject,
      upDownButtonEnableStatePublishSubject:
          _upDownButtonEnableStatePublishSubject,
      firstDate: _firstDate,
      lastDate: _lastDate,
      onMonthSelected: _onMonthSelected,
    );
  }

  void dispose() {
    _upDownPageLimitPublishSubject.close();
    _upDownButtonEnableStatePublishSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var header = buildHeader(theme);
    var pager = buildPager(theme);
    var content = Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [pager, buildButtonBar(context)],
      ),
      color: theme.dialogBackgroundColor,
    );
    return Theme(
      data:
          Theme.of(context).copyWith(dialogBackgroundColor: Colors.transparent),
      child: Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Builder(builder: (context) {
              if (MediaQuery.of(context).orientation == Orientation.portrait) {
                return IntrinsicWidth(
                  child: Column(children: [header, content]),
                );
              }
              return IntrinsicHeight(
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [header, content]),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget buildButtonBar(
    BuildContext context,
  ) {
    return ButtonTheme.bar(
      child: ButtonBar(
        children: <Widget>[
          FlatButton(
            onPressed: () => Navigator.pop(context, null),
            child: Text('Anuluj'),
          ),
          FlatButton(
            onPressed: () => Navigator.pop(context, selectedDate),
            child: Text('Ok'),
          )
        ],
      ),
    );
  }

  Widget buildHeader(ThemeData theme) {
    return Material(
      color: theme.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '${numToPolishMonth(selectedDate.month)} ${selectedDate.year}',
              style: theme.primaryTextTheme.subhead,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _selector is MonthSelector
                    ? GestureDetector(
                        onTap: _onSelectYear,
                        child: new StreamBuilder<UpDownPageLimit>(
                          stream: _upDownPageLimitPublishSubject,
                          initialData: const UpDownPageLimit(0, 0),
                          builder: (_, snapshot) => Text(
                            '${DateTime(snapshot.data.upLimit).year}',
                            style: theme.primaryTextTheme.headline,
                          ),
                        ),
                      )
                    : new StreamBuilder<UpDownPageLimit>(
                        stream: _upDownPageLimitPublishSubject,
                        initialData: const UpDownPageLimit(0, 0),
                        builder: (_, snapshot) => Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${DateTime(snapshot.data.upLimit).year}',
                              style: theme.primaryTextTheme.headline,
                            ),
                            Text(
                              '-',
                              style: theme.primaryTextTheme.headline,
                            ),
                            Text(
                              '${DateTime(snapshot.data.downLimit).year}',
                              style: theme.primaryTextTheme.headline,
                            ),
                          ],
                        ),
                      ),
                new StreamBuilder<UpDownButtonEnableState>(
                  stream: _upDownButtonEnableStatePublishSubject,
                  initialData: const UpDownButtonEnableState(true, true),
                  builder: (_, snapshot) => Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_up,
                          color: snapshot.data.upState
                              ? theme.primaryIconTheme.color
                              : theme.primaryIconTheme.color.withOpacity(0.5),
                        ),
                        onPressed:
                            snapshot.data.upState ? _onUpButtonPressed : null,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: snapshot.data.downState
                              ? theme.primaryIconTheme.color
                              : theme.primaryIconTheme.color.withOpacity(0.5),
                        ),
                        onPressed: snapshot.data.downState
                            ? _onDownButtonPressed
                            : null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPager(ThemeData theme) {
    return SizedBox(
      height: 230.0,
      width: 300.0,
      child: Theme(
        data: theme.copyWith(
          buttonTheme: ButtonThemeData(
            padding: EdgeInsets.all(2.0),
            shape: CircleBorder(),
            minWidth: 4.0,
          ),
        ),
        child: new AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) =>
              ScaleTransition(child: child, scale: animation),
          child: _selector,
        ),
      ),
    );
  }

  void _onSelectYear() => setState(() => _selector = new YearSelector(
        key: _yearSelectorState,
        initialDate: selectedDate,
        firstDate: _firstDate,
        lastDate: _lastDate,
        onYearSelected: _onYearSelected,
        upDownPageLimitPublishSubject: _upDownPageLimitPublishSubject,
        upDownButtonEnableStatePublishSubject:
            _upDownButtonEnableStatePublishSubject,
      ));

  void _onYearSelected(final int year) =>
      setState(() => _selector = new MonthSelector(
            key: _monthSelectorState,
            openDate: DateTime(year),
            selectedDate: selectedDate,
            upDownPageLimitPublishSubject: _upDownPageLimitPublishSubject,
            upDownButtonEnableStatePublishSubject:
                _upDownButtonEnableStatePublishSubject,
            firstDate: _firstDate,
            lastDate: _lastDate,
            onMonthSelected: _onMonthSelected,
          ));

  void _onMonthSelected(final DateTime date) => setState(() {
        selectedDate = date;
        _selector = new MonthSelector(
          key: _monthSelectorState,
          openDate: selectedDate,
          selectedDate: selectedDate,
          upDownPageLimitPublishSubject: _upDownPageLimitPublishSubject,
          upDownButtonEnableStatePublishSubject:
              _upDownButtonEnableStatePublishSubject,
          firstDate: _firstDate,
          lastDate: _lastDate,
          onMonthSelected: _onMonthSelected,
        );
      });

  void _onUpButtonPressed() {
    if (_yearSelectorState.currentState != null) {
      _yearSelectorState.currentState.goUp();
    } else {
      _monthSelectorState.currentState.goUp();
    }
  }

  void _onDownButtonPressed() {
    if (_yearSelectorState.currentState != null) {
      _yearSelectorState.currentState.goDown();
    } else {
      _monthSelectorState.currentState.goDown();
    }
  }
}

class YearSelector extends StatefulWidget {
  final ValueChanged<int> onYearSelected;
  final DateTime initialDate, firstDate, lastDate;
  final PublishSubject<UpDownPageLimit> upDownPageLimitPublishSubject;
  final PublishSubject<UpDownButtonEnableState>
      upDownButtonEnableStatePublishSubject;
  const YearSelector({
    Key key,
    @required this.initialDate,
    @required this.onYearSelected,
    @required this.upDownPageLimitPublishSubject,
    @required this.upDownButtonEnableStatePublishSubject,
    this.firstDate,
    this.lastDate,
  })  : assert(initialDate != null),
        assert(onYearSelected != null),
        assert(upDownPageLimitPublishSubject != null),
        assert(upDownButtonEnableStatePublishSubject != null),
        super(key: key);
  @override
  State<StatefulWidget> createState() => YearSelectorState();
}

class YearSelectorState extends State<YearSelector> {
  PageController _pageController;

  @override
  Widget build(BuildContext context) => PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        onPageChanged: _onPageChange,
        itemCount: _getPageCount(),
        itemBuilder: _yearGridBuilder,
      );

  Widget _yearGridBuilder(final BuildContext context, final int page) =>
      GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(8.0),
        crossAxisCount: 4,
        children: List<Widget>.generate(
          12,
          (final int index) => _getYearButton(page, index, _locale(context)),
        ).toList(growable: false),
      );

  Widget _getYearButton(final int page, final int index, final String locale) {
    final int year = (widget.firstDate == null ? 0 : widget.firstDate.year) +
        page * 12 +
        index;
    final bool isEnabled = _isEnabled(year);
    return FlatButton(
      onPressed: isEnabled ? () => widget.onYearSelected(year) : null,
      color: year == widget.initialDate.year
          ? Theme.of(context).accentColor
          : null,
      textColor: year == widget.initialDate.year
          ? Theme.of(context).accentTextTheme.button.color
          : year == DateTime.now().year ? Theme.of(context).accentColor : null,
      child: Text(
        DateFormat.y(locale).format(DateTime(year)),
      ),
    );
  }

  void _onPageChange(final int page) {
    widget.upDownPageLimitPublishSubject.add(new UpDownPageLimit(
        widget.firstDate == null
            ? page * 12
            : widget.firstDate.year + page * 12,
        widget.firstDate == null
            ? page * 12 + 11
            : widget.firstDate.year + page * 12 + 11));
    if (page == 0 || page == _getPageCount() - 1) {
      widget.upDownButtonEnableStatePublishSubject.add(
        new UpDownButtonEnableState(page > 0, page < _getPageCount() - 1),
      );
    }
  }

  int _getPageCount() {
    if (widget.firstDate != null && widget.lastDate != null) {
      if (widget.lastDate.year - widget.firstDate.year <= 12)
        return 1;
      else
        return ((widget.lastDate.year - widget.firstDate.year + 1) / 12).ceil();
    } else if (widget.firstDate != null && widget.lastDate == null) {
      return (_getItemCount() / 12).ceil();
    } else if (widget.firstDate == null && widget.lastDate != null) {
      return (_getItemCount() / 12).ceil();
    } else
      return (9999 / 12).ceil();
  }

  int _getItemCount() {
    if (widget.firstDate != null && widget.lastDate != null) {
      return widget.lastDate.year - widget.firstDate.year + 1;
    } else if (widget.firstDate != null && widget.lastDate == null) {
      return (9999 - widget.firstDate.year);
    } else if (widget.firstDate == null && widget.lastDate != null) {
      return widget.lastDate.year;
    } else
      return 9999;
  }

  @override
  void initState() {
    _pageController = new PageController(
        initialPage: widget.firstDate == null
            ? (widget.initialDate.year / 12).floor()
            : ((widget.initialDate.year - widget.firstDate.year) / 12).floor());
    super.initState();
    new Future.delayed(Duration.zero, () {
      widget.upDownPageLimitPublishSubject.add(new UpDownPageLimit(
        widget.firstDate == null
            ? _pageController.page.toInt() * 12
            : widget.firstDate.year + _pageController.page.toInt() * 12,
        widget.firstDate == null
            ? _pageController.page.toInt() * 12 + 11
            : widget.firstDate.year + _pageController.page.toInt() * 12 + 11,
      ));
      widget.upDownButtonEnableStatePublishSubject.add(
        new UpDownButtonEnableState(_pageController.page.toInt() > 0,
            _pageController.page.toInt() < _getPageCount() - 1),
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  String _locale(BuildContext context) {
    var locale = Localizations.localeOf(context);
    if (locale == null) {
      return Intl.systemLocale;
    }
    return '${locale.languageCode}_${locale.countryCode}';
  }

  bool _isEnabled(final int year) {
    if (widget.firstDate == null && widget.lastDate == null)
      return true;
    else if (widget.firstDate != null &&
        widget.lastDate != null &&
        year >= widget.firstDate.year &&
        year <= widget.lastDate.year)
      return true;
    else if (widget.firstDate != null &&
        widget.lastDate == null &&
        year >= widget.firstDate.year)
      return true;
    else if (widget.firstDate == null &&
        widget.lastDate != null &&
        year <= widget.lastDate.year)
      return true;
    else
      return false;
  }

  void goDown() {
    _pageController.animateToPage(
      _pageController.page.toInt() + 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void goUp() {
    _pageController.animateToPage(
      _pageController.page.toInt() - 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}

class UpDownPageLimit {
  final int upLimit;
  final int downLimit;
  const UpDownPageLimit(this.upLimit, this.downLimit);
}

class UpDownButtonEnableState {
  final bool upState;
  final bool downState;
  const UpDownButtonEnableState(this.upState, this.downState);
}

class MonthSelector extends StatefulWidget {
  final ValueChanged<DateTime> onMonthSelected;
  final int selectedYear;
  final DateTime openDate, selectedDate, firstDate, lastDate;
  final ValueChanged<int> onYearSelected;
  final PublishSubject<UpDownPageLimit> upDownPageLimitPublishSubject;
  final PublishSubject<UpDownButtonEnableState>
      upDownButtonEnableStatePublishSubject;
  const MonthSelector({
    Key key,
    @required this.openDate,
    @required this.selectedDate,
    this.selectedYear,
    this.onYearSelected,
    @required this.onMonthSelected,
    @required this.upDownPageLimitPublishSubject,
    @required this.upDownButtonEnableStatePublishSubject,
    this.firstDate,
    this.lastDate,
  })  : assert(openDate != null),
        assert(selectedDate != null),
        assert(onMonthSelected != null),
        assert(upDownPageLimitPublishSubject != null),
        assert(upDownButtonEnableStatePublishSubject != null),
        super(key: key);
  @override
  State<StatefulWidget> createState() => MonthSelectorState();
}

class MonthSelectorState extends State<MonthSelector> {
  PageController _pageController;

  @override
  Widget build(BuildContext context) => PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        onPageChanged: _onPageChange,
        itemCount: _getPageCount(),
        itemBuilder: _yearGridBuilder,
      );

  Widget _yearGridBuilder(final BuildContext context, final int page) {
      var currentYearSelected = widget.selectedYear != null && widget.selectedYear == widget.openDate.year;
      return Column(children: [
        GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.all(8.0),
        crossAxisCount: 4,
        children: List<Widget>.generate(
          12,
          (final int index) => _getMonthButton(DateTime(
              widget.firstDate != null ? widget.firstDate.year + page : page,
              index + 1)),
        ).toList(growable: false))]
      );
  }

  Widget _getMonthButton(final DateTime date) {
    final bool isEnabled = _isEnabled(date);
    return FlatButton(
      onPressed: isEnabled
          ? () => widget.onMonthSelected(DateTime(date.year, date.month))
          : null,
      color: date.month == widget.selectedDate.month &&
              date.year == widget.selectedDate.year
          ? Theme.of(context).accentColor
          : null,
      textColor: date.month == widget.selectedDate.month &&
              date.year == widget.selectedDate.year
          ? Theme.of(context).accentTextTheme.button.color
          : date.month == DateTime.now().month &&
                  date.year == DateTime.now().year
              ? Theme.of(context).accentColor
              : null,
      child: Text(
        numToPolishMonth(date.month),
      ),
    );
  }

  void _onPageChange(final int page) {
    widget.upDownPageLimitPublishSubject.add(
      new UpDownPageLimit(
        widget.firstDate != null ? widget.firstDate.year + page : page,
        0,
      ),
    );
    widget.upDownButtonEnableStatePublishSubject.add(
      new UpDownButtonEnableState(page > 0, page < _getPageCount() - 1),
    );
  }

  int _getPageCount() {
    if (widget.firstDate != null && widget.lastDate != null) {
      return widget.lastDate.year - widget.firstDate.year + 1;
    } else if (widget.firstDate != null && widget.lastDate == null) {
      return 9999 - widget.firstDate.year;
    } else if (widget.firstDate == null && widget.lastDate != null) {
      return widget.lastDate.year;
    } else
      return 9999;
  }

  @override
  void initState() {
    _pageController = new PageController(
        initialPage: widget.firstDate == null
            ? widget.openDate.year
            : widget.openDate.year - widget.firstDate.year);
    super.initState();
    new Future.delayed(Duration.zero, () {
      widget.upDownPageLimitPublishSubject.add(
        new UpDownPageLimit(
          widget.firstDate == null
              ? _pageController.page.toInt()
              : widget.firstDate.year + _pageController.page.toInt(),
          0,
        ),
      );
      widget.upDownButtonEnableStatePublishSubject.add(
        new UpDownButtonEnableState(
          _pageController.page.toInt() > 0,
          _pageController.page.toInt() < _getPageCount() - 1,
        ),
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  String _locale(BuildContext context) {
    var locale = Localizations.localeOf(context);
    if (locale == null) {
      return Intl.systemLocale;
    }
    return '${locale.languageCode}_${locale.countryCode}';
  }

  bool _isEnabled(final DateTime date) {
    if (widget.firstDate == null && widget.lastDate == null)
      return true;
    else if (widget.firstDate != null &&
        widget.lastDate != null &&
        widget.firstDate.compareTo(date) <= 0 &&
        widget.lastDate.compareTo(date) >= 0)
      return true;
    else if (widget.firstDate != null &&
        widget.lastDate == null &&
        widget.firstDate.compareTo(date) <= 0)
      return true;
    else if (widget.firstDate == null &&
        widget.lastDate != null &&
        widget.lastDate.compareTo(date) >= 0)
      return true;
    else
      return false;
  }

  void goDown() {
    _pageController.animateToPage(
      _pageController.page.toInt() + 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void goUp() {
    _pageController.animateToPage(
      _pageController.page.toInt() - 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}