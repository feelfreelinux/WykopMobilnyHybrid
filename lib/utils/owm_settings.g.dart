// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owm_settings.dart';

// **************************************************************************
// ReactiveSharedPreferencesGenerator
// **************************************************************************

class _$OWMSettings implements OWMSettings {
  _$OWMSettings(PreferenceAdapter adapter) : this._adapter = adapter {
    useDarkThemeSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("useDarkTheme", value);
            _useDarkThemeSubject.add(value);
          }))
        .sink;
    autoDarkThemeSink = (StreamController<int>.broadcast()
          ..stream.listen((value) async {
            await adapter.setInt("autoDarkTheme", value);
            _autoDarkThemeSubject.add(value);
          }))
        .sink;
    autoDarkThemeTimeFromSink = (StreamController<String>.broadcast()
          ..stream.listen((value) async {
            await adapter.setString("autoDarkThemeTimeFrom", value);
            _autoDarkThemeTimeFromSubject.add(value);
          }))
        .sink;
    autoDarkThemeTimeToSink = (StreamController<String>.broadcast()
          ..stream.listen((value) async {
            await adapter.setString("autoDarkThemeTimeTo", value);
            _autoDarkThemeTimeToSubject.add(value);
          }))
        .sink;
    simpleLinkViewSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("simpleLinkView", value);
            _simpleLinkViewSubject.add(value);
          }))
        .sink;
    accentColorSink = (StreamController<int>.broadcast()
          ..stream.listen((value) async {
            await adapter.setInt("accentColor", value);
            _accentColorSubject.add(value);
          }))
        .sink;
    useYoutubePlayerSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("useYoutubePlayer", value);
            _useYoutubePlayerSubject.add(value);
          }))
        .sink;
    useOtherPlayerSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("useOtherPlayer", value);
            _useOtherPlayerSubject.add(value);
          }))
        .sink;
    useAutoplaySink = (StreamController<int>.broadcast()
          ..stream.listen((value) async {
            await adapter.setInt("useAutoplay", value);
            _useAutoplaySubject.add(value);
          }))
        .sink;
    highResAvatarSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("highResAvatar", value);
            _highResAvatarSubject.add(value);
          }))
        .sink;
    highResImageSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("highResImage", value);
            _highResImageSubject.add(value);
          }))
        .sink;
    hiddingLinkThumbSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("hiddingLinkThumb", value);
            _hiddingLinkThumbSubject.add(value);
          }))
        .sink;
    hiddingEntryImageSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("hiddingEntryImage", value);
            _hiddingEntryImageSubject.add(value);
          }))
        .sink;
    hiddingCommentImageSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("hiddingCommentImage", value);
            _hiddingCommentImageSubject.add(value);
          }))
        .sink;
    shortLongPictureSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("shortLongPicture", value);
            _shortLongPictureSubject.add(value);
          }))
        .sink;
    skipExpandImageSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("skipExpandImage", value);
            _skipExpandImageSubject.add(value);
          }))
        .sink;
    skipShowAdultImageSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("skipShowAdultImage", value);
            _skipShowAdultImageSubject.add(value);
          }))
        .sink;
    shortLongBodySink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("shortLongBody", value);
            _shortLongBodySubject.add(value);
          }))
        .sink;
    hideSpoilerTextSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("hideSpoilerText", value);
            _hideSpoilerTextSubject.add(value);
          }))
        .sink;
    openSpoilerDialogSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("openSpoilerDialog", value);
            _openSpoilerDialogSubject.add(value);
          }))
        .sink;
    textSizeSink = (StreamController<double>.broadcast()
          ..stream.listen((value) async {
            await adapter.setDouble("textSize", value);
            _textSizeSubject.add(value);
          }))
        .sink;
    useNotificationSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("useNotification", value);
            _useNotificationSubject.add(value);
          }))
        .sink;
    usePushNotificationSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("usePushNotification", value);
            _usePushNotificationSubject.add(value);
          }))
        .sink;
    timeCheckNotificationSink = (StreamController<int>.broadcast()
          ..stream.listen((value) async {
            await adapter.setInt("timeCheckNotification", value);
            _timeCheckNotificationSubject.add(value);
          }))
        .sink;
    useSoundNotificationSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("useSoundNotification", value);
            _useSoundNotificationSubject.add(value);
          }))
        .sink;
    useVibrationNotificationSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("useVibrationNotification", value);
            _useVibrationNotificationSubject.add(value);
          }))
        .sink;
    useSoundAppSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("useSoundApp", value);
            _useSoundAppSubject.add(value);
          }))
        .sink;
    defaultAppScreenSink = (StreamController<int>.broadcast()
          ..stream.listen((value) async {
            await adapter.setInt("defaultAppScreen", value);
            _defaultAppScreenSubject.add(value);
          }))
        .sink;
    defaultLinkScreenSink = (StreamController<int>.broadcast()
          ..stream.listen((value) async {
            await adapter.setInt("defaultLinkScreen", value);
            _defaultLinkScreenSubject.add(value);
          }))
        .sink;
    defaultEntryScreenSink = (StreamController<int>.broadcast()
          ..stream.listen((value) async {
            await adapter.setInt("defaultEntryScreen", value);
            _defaultEntryScreenSubject.add(value);
          }))
        .sink;
    defaultMyWykopScreenSink = (StreamController<int>.broadcast()
          ..stream.listen((value) async {
            await adapter.setInt("defaultMyWykopScreen", value);
            _defaultMyWykopScreenSubject.add(value);
          }))
        .sink;
    defaultNotificationScreenSink = (StreamController<int>.broadcast()
          ..stream.listen((value) async {
            await adapter.setInt("defaultNotificationScreen", value);
            _defaultNotificationScreenSubject.add(value);
          }))
        .sink;
    linkOpenBrowserSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("linkOpenBrowser", value);
            _linkOpenBrowserSubject.add(value);
          }))
        .sink;
    imageOpenBrowserSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("imageOpenBrowser", value);
            _imageOpenBrowserSubject.add(value);
          }))
        .sink;
    hideCommentLinkSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("hideCommentLink", value);
            _hideCommentLinkSubject.add(value);
          }))
        .sink;
    splitVotesLinkSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("splitVotesLink", value);
            _splitVotesLinkSubject.add(value);
          }))
        .sink;
    hideAdultImageSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("hideAdultImage", value);
            _hideAdultImageSubject.add(value);
          }))
        .sink;
    expandNewbieContentSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("expandNewbieContent", value);
            _expandNewbieContentSubject.add(value);
          }))
        .sink;
    expandNoTagContentSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("expandNoTagContent", value);
            _expandNoTagContentSubject.add(value);
          }))
        .sink;
    hideExpandContentSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("hideExpandContent", value);
            _hideExpandContentSubject.add(value);
          }))
        .sink;
    confirmDeleteSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("confirmDelete", value);
            _confirmDeleteSubject.add(value);
          }))
        .sink;
    confirmSendSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("confirmSend", value);
            _confirmSendSubject.add(value);
          }))
        .sink;
    confirmExitWritingSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("confirmExitWriting", value);
            _confirmExitWritingSubject.add(value);
          }))
        .sink;
    confirmExitAppSink = (StreamController<bool>.broadcast()
          ..stream.listen((value) async {
            await adapter.setBool("confirmExitApp", value);
            _confirmExitAppSubject.add(value);
          }))
        .sink;
    _adapter.getBool("useDarkTheme").then((value) {
      return value ?? false;
    }).then(useDarkThemeSink.add);
    _adapter.getInt("autoDarkTheme").then((value) {
      return value ?? 0;
    }).then(autoDarkThemeSink.add);
    _adapter.getString("autoDarkThemeTimeFrom").then((value) {
      return value ?? '20:00';
    }).then(autoDarkThemeTimeFromSink.add);
    _adapter.getString("autoDarkThemeTimeTo").then((value) {
      return value ?? '08:00';
    }).then(autoDarkThemeTimeToSink.add);
    _adapter.getBool("simpleLinkView").then((value) {
      return value ?? false;
    }).then(simpleLinkViewSink.add);
    _adapter.getInt("accentColor").then((value) {
      return value ?? 4280391411;
    }).then(accentColorSink.add);
    _adapter.getBool("useYoutubePlayer").then((value) {
      return value ?? true;
    }).then(useYoutubePlayerSink.add);
    _adapter.getBool("useOtherPlayer").then((value) {
      return value ?? true;
    }).then(useOtherPlayerSink.add);
    _adapter.getInt("useAutoplay").then((value) {
      return value ?? 0;
    }).then(useAutoplaySink.add);
    _adapter.getBool("highResAvatar").then((value) {
      return value ?? true;
    }).then(highResAvatarSink.add);
    _adapter.getBool("highResImage").then((value) {
      return value ?? false;
    }).then(highResImageSink.add);
    _adapter.getBool("hiddingLinkThumb").then((value) {
      return value ?? false;
    }).then(hiddingLinkThumbSink.add);
    _adapter.getBool("hiddingEntryImage").then((value) {
      return value ?? false;
    }).then(hiddingEntryImageSink.add);
    _adapter.getBool("hiddingCommentImage").then((value) {
      return value ?? false;
    }).then(hiddingCommentImageSink.add);
    _adapter.getBool("shortLongPicture").then((value) {
      return value ?? true;
    }).then(shortLongPictureSink.add);
    _adapter.getBool("skipExpandImage").then((value) {
      return value ?? false;
    }).then(skipExpandImageSink.add);
    _adapter.getBool("skipShowAdultImage").then((value) {
      return value ?? false;
    }).then(skipShowAdultImageSink.add);
    _adapter.getBool("shortLongBody").then((value) {
      return value ?? true;
    }).then(shortLongBodySink.add);
    _adapter.getBool("hideSpoilerText").then((value) {
      return value ?? true;
    }).then(hideSpoilerTextSink.add);
    _adapter.getBool("openSpoilerDialog").then((value) {
      return value ?? false;
    }).then(openSpoilerDialogSink.add);
    _adapter.getDouble("textSize").then((value) {
      return value ?? 1.0;
    }).then(textSizeSink.add);
    _adapter.getBool("useNotification").then((value) {
      return value ?? true;
    }).then(useNotificationSink.add);
    _adapter.getBool("usePushNotification").then((value) {
      return value ?? false;
    }).then(usePushNotificationSink.add);
    _adapter.getInt("timeCheckNotification").then((value) {
      return value ?? 15;
    }).then(timeCheckNotificationSink.add);
    _adapter.getBool("useSoundNotification").then((value) {
      return value ?? true;
    }).then(useSoundNotificationSink.add);
    _adapter.getBool("useVibrationNotification").then((value) {
      return value ?? true;
    }).then(useVibrationNotificationSink.add);
    _adapter.getBool("useSoundApp").then((value) {
      return value ?? true;
    }).then(useSoundAppSink.add);
    _adapter.getInt("defaultAppScreen").then((value) {
      return value ?? 0;
    }).then(defaultAppScreenSink.add);
    _adapter.getInt("defaultLinkScreen").then((value) {
      return value ?? 0;
    }).then(defaultLinkScreenSink.add);
    _adapter.getInt("defaultEntryScreen").then((value) {
      return value ?? 0;
    }).then(defaultEntryScreenSink.add);
    _adapter.getInt("defaultMyWykopScreen").then((value) {
      return value ?? 0;
    }).then(defaultMyWykopScreenSink.add);
    _adapter.getInt("defaultNotificationScreen").then((value) {
      return value ?? 0;
    }).then(defaultNotificationScreenSink.add);
    _adapter.getBool("linkOpenBrowser").then((value) {
      return value ?? false;
    }).then(linkOpenBrowserSink.add);
    _adapter.getBool("imageOpenBrowser").then((value) {
      return value ?? false;
    }).then(imageOpenBrowserSink.add);
    _adapter.getBool("hideCommentLink").then((value) {
      return value ?? false;
    }).then(hideCommentLinkSink.add);
    _adapter.getBool("splitVotesLink").then((value) {
      return value ?? false;
    }).then(splitVotesLinkSink.add);
    _adapter.getBool("hideAdultImage").then((value) {
      return value ?? true;
    }).then(hideAdultImageSink.add);
    _adapter.getBool("expandNewbieContent").then((value) {
      return value ?? false;
    }).then(expandNewbieContentSink.add);
    _adapter.getBool("expandNoTagContent").then((value) {
      return value ?? false;
    }).then(expandNoTagContentSink.add);
    _adapter.getBool("hideExpandContent").then((value) {
      return value ?? false;
    }).then(hideExpandContentSink.add);
    _adapter.getBool("confirmDelete").then((value) {
      return value ?? true;
    }).then(confirmDeleteSink.add);
    _adapter.getBool("confirmSend").then((value) {
      return value ?? true;
    }).then(confirmSendSink.add);
    _adapter.getBool("confirmExitWriting").then((value) {
      return value ?? true;
    }).then(confirmExitWritingSink.add);
    _adapter.getBool("confirmExitApp").then((value) {
      return value ?? true;
    }).then(confirmExitAppSink.add);
  }

  final PreferenceAdapter _adapter;

  final BehaviorSubject<bool> _useDarkThemeSubject =
      BehaviorSubject<bool>(seedValue: false);

  final BehaviorSubject<int> _autoDarkThemeSubject =
      BehaviorSubject<int>(seedValue: 0);

  final BehaviorSubject<String> _autoDarkThemeTimeFromSubject =
      BehaviorSubject<String>(seedValue: '20:00');

  final BehaviorSubject<String> _autoDarkThemeTimeToSubject =
      BehaviorSubject<String>(seedValue: '08:00');

  final BehaviorSubject<bool> _simpleLinkViewSubject =
      BehaviorSubject<bool>(seedValue: false);

  final BehaviorSubject<int> _accentColorSubject =
      BehaviorSubject<int>(seedValue: 4280391411);

  final BehaviorSubject<bool> _useYoutubePlayerSubject =
      BehaviorSubject<bool>(seedValue: true);

  final BehaviorSubject<bool> _useOtherPlayerSubject =
      BehaviorSubject<bool>(seedValue: true);

  final BehaviorSubject<int> _useAutoplaySubject =
      BehaviorSubject<int>(seedValue: 0);

  final BehaviorSubject<bool> _highResAvatarSubject =
      BehaviorSubject<bool>(seedValue: true);

  final BehaviorSubject<bool> _highResImageSubject =
      BehaviorSubject<bool>(seedValue: false);

  final BehaviorSubject<bool> _hiddingLinkThumbSubject =
      BehaviorSubject<bool>(seedValue: false);

  final BehaviorSubject<bool> _hiddingEntryImageSubject =
      BehaviorSubject<bool>(seedValue: false);

  final BehaviorSubject<bool> _hiddingCommentImageSubject =
      BehaviorSubject<bool>(seedValue: false);

  final BehaviorSubject<bool> _shortLongPictureSubject =
      BehaviorSubject<bool>(seedValue: true);

  final BehaviorSubject<bool> _skipExpandImageSubject =
      BehaviorSubject<bool>(seedValue: false);

  final BehaviorSubject<bool> _skipShowAdultImageSubject =
      BehaviorSubject<bool>(seedValue: false);

  final BehaviorSubject<bool> _shortLongBodySubject =
      BehaviorSubject<bool>(seedValue: true);

  final BehaviorSubject<bool> _hideSpoilerTextSubject =
      BehaviorSubject<bool>(seedValue: true);

  final BehaviorSubject<bool> _openSpoilerDialogSubject =
      BehaviorSubject<bool>(seedValue: false);

  final BehaviorSubject<double> _textSizeSubject =
      BehaviorSubject<double>(seedValue: 1.0);

  final BehaviorSubject<bool> _useNotificationSubject =
      BehaviorSubject<bool>(seedValue: true);

  final BehaviorSubject<bool> _usePushNotificationSubject =
      BehaviorSubject<bool>(seedValue: false);

  final BehaviorSubject<int> _timeCheckNotificationSubject =
      BehaviorSubject<int>(seedValue: 15);

  final BehaviorSubject<bool> _useSoundNotificationSubject =
      BehaviorSubject<bool>(seedValue: true);

  final BehaviorSubject<bool> _useVibrationNotificationSubject =
      BehaviorSubject<bool>(seedValue: true);

  final BehaviorSubject<bool> _useSoundAppSubject =
      BehaviorSubject<bool>(seedValue: true);

  final BehaviorSubject<int> _defaultAppScreenSubject =
      BehaviorSubject<int>(seedValue: 0);

  final BehaviorSubject<int> _defaultLinkScreenSubject =
      BehaviorSubject<int>(seedValue: 0);

  final BehaviorSubject<int> _defaultEntryScreenSubject =
      BehaviorSubject<int>(seedValue: 0);

  final BehaviorSubject<int> _defaultMyWykopScreenSubject =
      BehaviorSubject<int>(seedValue: 0);

  final BehaviorSubject<int> _defaultNotificationScreenSubject =
      BehaviorSubject<int>(seedValue: 0);

  final BehaviorSubject<bool> _linkOpenBrowserSubject =
      BehaviorSubject<bool>(seedValue: false);

  final BehaviorSubject<bool> _imageOpenBrowserSubject =
      BehaviorSubject<bool>(seedValue: false);

  final BehaviorSubject<bool> _hideCommentLinkSubject =
      BehaviorSubject<bool>(seedValue: false);

  final BehaviorSubject<bool> _splitVotesLinkSubject =
      BehaviorSubject<bool>(seedValue: false);

  final BehaviorSubject<bool> _hideAdultImageSubject =
      BehaviorSubject<bool>(seedValue: true);

  final BehaviorSubject<bool> _expandNewbieContentSubject =
      BehaviorSubject<bool>(seedValue: false);

  final BehaviorSubject<bool> _expandNoTagContentSubject =
      BehaviorSubject<bool>(seedValue: false);

  final BehaviorSubject<bool> _hideExpandContentSubject =
      BehaviorSubject<bool>(seedValue: false);

  final BehaviorSubject<bool> _confirmDeleteSubject =
      BehaviorSubject<bool>(seedValue: true);

  final BehaviorSubject<bool> _confirmSendSubject =
      BehaviorSubject<bool>(seedValue: true);

  final BehaviorSubject<bool> _confirmExitWritingSubject =
      BehaviorSubject<bool>(seedValue: true);

  final BehaviorSubject<bool> _confirmExitAppSubject =
      BehaviorSubject<bool>(seedValue: true);

  Sink<bool> useDarkThemeSink;

  Sink<int> autoDarkThemeSink;

  Sink<String> autoDarkThemeTimeFromSink;

  Sink<String> autoDarkThemeTimeToSink;

  Sink<bool> simpleLinkViewSink;

  Sink<int> accentColorSink;

  Sink<bool> useYoutubePlayerSink;

  Sink<bool> useOtherPlayerSink;

  Sink<int> useAutoplaySink;

  Sink<bool> highResAvatarSink;

  Sink<bool> highResImageSink;

  Sink<bool> hiddingLinkThumbSink;

  Sink<bool> hiddingEntryImageSink;

  Sink<bool> hiddingCommentImageSink;

  Sink<bool> shortLongPictureSink;

  Sink<bool> skipExpandImageSink;

  Sink<bool> skipShowAdultImageSink;

  Sink<bool> shortLongBodySink;

  Sink<bool> hideSpoilerTextSink;

  Sink<bool> openSpoilerDialogSink;

  Sink<double> textSizeSink;

  Sink<bool> useNotificationSink;

  Sink<bool> usePushNotificationSink;

  Sink<int> timeCheckNotificationSink;

  Sink<bool> useSoundNotificationSink;

  Sink<bool> useVibrationNotificationSink;

  Sink<bool> useSoundAppSink;

  Sink<int> defaultAppScreenSink;

  Sink<int> defaultLinkScreenSink;

  Sink<int> defaultEntryScreenSink;

  Sink<int> defaultMyWykopScreenSink;

  Sink<int> defaultNotificationScreenSink;

  Sink<bool> linkOpenBrowserSink;

  Sink<bool> imageOpenBrowserSink;

  Sink<bool> hideCommentLinkSink;

  Sink<bool> splitVotesLinkSink;

  Sink<bool> hideAdultImageSink;

  Sink<bool> expandNewbieContentSink;

  Sink<bool> expandNoTagContentSink;

  Sink<bool> hideExpandContentSink;

  Sink<bool> confirmDeleteSink;

  Sink<bool> confirmSendSink;

  Sink<bool> confirmExitWritingSink;

  Sink<bool> confirmExitAppSink;

  Stream<bool> get useDarkThemeStream =>
      _useDarkThemeSubject.asBroadcastStream();
  Stream<int> get autoDarkThemeStream =>
      _autoDarkThemeSubject.asBroadcastStream();
  Stream<String> get autoDarkThemeTimeFromStream =>
      _autoDarkThemeTimeFromSubject.asBroadcastStream();
  Stream<String> get autoDarkThemeTimeToStream =>
      _autoDarkThemeTimeToSubject.asBroadcastStream();
  Stream<bool> get simpleLinkViewStream =>
      _simpleLinkViewSubject.asBroadcastStream();
  Stream<int> get accentColorStream => _accentColorSubject.asBroadcastStream();
  Stream<bool> get useYoutubePlayerStream =>
      _useYoutubePlayerSubject.asBroadcastStream();
  Stream<bool> get useOtherPlayerStream =>
      _useOtherPlayerSubject.asBroadcastStream();
  Stream<int> get useAutoplayStream => _useAutoplaySubject.asBroadcastStream();
  Stream<bool> get highResAvatarStream =>
      _highResAvatarSubject.asBroadcastStream();
  Stream<bool> get highResImageStream =>
      _highResImageSubject.asBroadcastStream();
  Stream<bool> get hiddingLinkThumbStream =>
      _hiddingLinkThumbSubject.asBroadcastStream();
  Stream<bool> get hiddingEntryImageStream =>
      _hiddingEntryImageSubject.asBroadcastStream();
  Stream<bool> get hiddingCommentImageStream =>
      _hiddingCommentImageSubject.asBroadcastStream();
  Stream<bool> get shortLongPictureStream =>
      _shortLongPictureSubject.asBroadcastStream();
  Stream<bool> get skipExpandImageStream =>
      _skipExpandImageSubject.asBroadcastStream();
  Stream<bool> get skipShowAdultImageStream =>
      _skipShowAdultImageSubject.asBroadcastStream();
  Stream<bool> get shortLongBodyStream =>
      _shortLongBodySubject.asBroadcastStream();
  Stream<bool> get hideSpoilerTextStream =>
      _hideSpoilerTextSubject.asBroadcastStream();
  Stream<bool> get openSpoilerDialogStream =>
      _openSpoilerDialogSubject.asBroadcastStream();
  Stream<double> get textSizeStream => _textSizeSubject.asBroadcastStream();
  Stream<bool> get useNotificationStream =>
      _useNotificationSubject.asBroadcastStream();
  Stream<bool> get usePushNotificationStream =>
      _usePushNotificationSubject.asBroadcastStream();
  Stream<int> get timeCheckNotificationStream =>
      _timeCheckNotificationSubject.asBroadcastStream();
  Stream<bool> get useSoundNotificationStream =>
      _useSoundNotificationSubject.asBroadcastStream();
  Stream<bool> get useVibrationNotificationStream =>
      _useVibrationNotificationSubject.asBroadcastStream();
  Stream<bool> get useSoundAppStream => _useSoundAppSubject.asBroadcastStream();
  Stream<int> get defaultAppScreenStream =>
      _defaultAppScreenSubject.asBroadcastStream();
  Stream<int> get defaultLinkScreenStream =>
      _defaultLinkScreenSubject.asBroadcastStream();
  Stream<int> get defaultEntryScreenStream =>
      _defaultEntryScreenSubject.asBroadcastStream();
  Stream<int> get defaultMyWykopScreenStream =>
      _defaultMyWykopScreenSubject.asBroadcastStream();
  Stream<int> get defaultNotificationScreenStream =>
      _defaultNotificationScreenSubject.asBroadcastStream();
  Stream<bool> get linkOpenBrowserStream =>
      _linkOpenBrowserSubject.asBroadcastStream();
  Stream<bool> get imageOpenBrowserStream =>
      _imageOpenBrowserSubject.asBroadcastStream();
  Stream<bool> get hideCommentLinkStream =>
      _hideCommentLinkSubject.asBroadcastStream();
  Stream<bool> get splitVotesLinkStream =>
      _splitVotesLinkSubject.asBroadcastStream();
  Stream<bool> get hideAdultImageStream =>
      _hideAdultImageSubject.asBroadcastStream();
  Stream<bool> get expandNewbieContentStream =>
      _expandNewbieContentSubject.asBroadcastStream();
  Stream<bool> get expandNoTagContentStream =>
      _expandNoTagContentSubject.asBroadcastStream();
  Stream<bool> get hideExpandContentStream =>
      _hideExpandContentSubject.asBroadcastStream();
  Stream<bool> get confirmDeleteStream =>
      _confirmDeleteSubject.asBroadcastStream();
  Stream<bool> get confirmSendStream => _confirmSendSubject.asBroadcastStream();
  Stream<bool> get confirmExitWritingStream =>
      _confirmExitWritingSubject.asBroadcastStream();
  Stream<bool> get confirmExitAppStream =>
      _confirmExitAppSubject.asBroadcastStream();
  bool get useDarkTheme => _useDarkThemeSubject.value;
  int get autoDarkTheme => _autoDarkThemeSubject.value;
  String get autoDarkThemeTimeFrom => _autoDarkThemeTimeFromSubject.value;
  String get autoDarkThemeTimeTo => _autoDarkThemeTimeToSubject.value;
  bool get simpleLinkView => _simpleLinkViewSubject.value;
  int get accentColor => _accentColorSubject.value;
  bool get useYoutubePlayer => _useYoutubePlayerSubject.value;
  bool get useOtherPlayer => _useOtherPlayerSubject.value;
  int get useAutoplay => _useAutoplaySubject.value;
  bool get highResAvatar => _highResAvatarSubject.value;
  bool get highResImage => _highResImageSubject.value;
  bool get hiddingLinkThumb => _hiddingLinkThumbSubject.value;
  bool get hiddingEntryImage => _hiddingEntryImageSubject.value;
  bool get hiddingCommentImage => _hiddingCommentImageSubject.value;
  bool get shortLongPicture => _shortLongPictureSubject.value;
  bool get skipExpandImage => _skipExpandImageSubject.value;
  bool get skipShowAdultImage => _skipShowAdultImageSubject.value;
  bool get shortLongBody => _shortLongBodySubject.value;
  bool get hideSpoilerText => _hideSpoilerTextSubject.value;
  bool get openSpoilerDialog => _openSpoilerDialogSubject.value;
  double get textSize => _textSizeSubject.value;
  bool get useNotification => _useNotificationSubject.value;
  bool get usePushNotification => _usePushNotificationSubject.value;
  int get timeCheckNotification => _timeCheckNotificationSubject.value;
  bool get useSoundNotification => _useSoundNotificationSubject.value;
  bool get useVibrationNotification => _useVibrationNotificationSubject.value;
  bool get useSoundApp => _useSoundAppSubject.value;
  int get defaultAppScreen => _defaultAppScreenSubject.value;
  int get defaultLinkScreen => _defaultLinkScreenSubject.value;
  int get defaultEntryScreen => _defaultEntryScreenSubject.value;
  int get defaultMyWykopScreen => _defaultMyWykopScreenSubject.value;
  int get defaultNotificationScreen => _defaultNotificationScreenSubject.value;
  bool get linkOpenBrowser => _linkOpenBrowserSubject.value;
  bool get imageOpenBrowser => _imageOpenBrowserSubject.value;
  bool get hideCommentLink => _hideCommentLinkSubject.value;
  bool get splitVotesLink => _splitVotesLinkSubject.value;
  bool get hideAdultImage => _hideAdultImageSubject.value;
  bool get expandNewbieContent => _expandNewbieContentSubject.value;
  bool get expandNoTagContent => _expandNoTagContentSubject.value;
  bool get hideExpandContent => _hideExpandContentSubject.value;
  bool get confirmDelete => _confirmDeleteSubject.value;
  bool get confirmSend => _confirmSendSubject.value;
  bool get confirmExitWriting => _confirmExitWritingSubject.value;
  bool get confirmExitApp => _confirmExitAppSubject.value;
  set useDarkTheme(bool value) => useDarkThemeSink.add(value);
  set autoDarkTheme(int value) => autoDarkThemeSink.add(value);
  set autoDarkThemeTimeFrom(String value) =>
      autoDarkThemeTimeFromSink.add(value);
  set autoDarkThemeTimeTo(String value) => autoDarkThemeTimeToSink.add(value);
  set simpleLinkView(bool value) => simpleLinkViewSink.add(value);
  set accentColor(int value) => accentColorSink.add(value);
  set useYoutubePlayer(bool value) => useYoutubePlayerSink.add(value);
  set useOtherPlayer(bool value) => useOtherPlayerSink.add(value);
  set useAutoplay(int value) => useAutoplaySink.add(value);
  set highResAvatar(bool value) => highResAvatarSink.add(value);
  set highResImage(bool value) => highResImageSink.add(value);
  set hiddingLinkThumb(bool value) => hiddingLinkThumbSink.add(value);
  set hiddingEntryImage(bool value) => hiddingEntryImageSink.add(value);
  set hiddingCommentImage(bool value) => hiddingCommentImageSink.add(value);
  set shortLongPicture(bool value) => shortLongPictureSink.add(value);
  set skipExpandImage(bool value) => skipExpandImageSink.add(value);
  set skipShowAdultImage(bool value) => skipShowAdultImageSink.add(value);
  set shortLongBody(bool value) => shortLongBodySink.add(value);
  set hideSpoilerText(bool value) => hideSpoilerTextSink.add(value);
  set openSpoilerDialog(bool value) => openSpoilerDialogSink.add(value);
  set textSize(double value) => textSizeSink.add(value);
  set useNotification(bool value) => useNotificationSink.add(value);
  set usePushNotification(bool value) => usePushNotificationSink.add(value);
  set timeCheckNotification(int value) => timeCheckNotificationSink.add(value);
  set useSoundNotification(bool value) => useSoundNotificationSink.add(value);
  set useVibrationNotification(bool value) =>
      useVibrationNotificationSink.add(value);
  set useSoundApp(bool value) => useSoundAppSink.add(value);
  set defaultAppScreen(int value) => defaultAppScreenSink.add(value);
  set defaultLinkScreen(int value) => defaultLinkScreenSink.add(value);
  set defaultEntryScreen(int value) => defaultEntryScreenSink.add(value);
  set defaultMyWykopScreen(int value) => defaultMyWykopScreenSink.add(value);
  set defaultNotificationScreen(int value) =>
      defaultNotificationScreenSink.add(value);
  set linkOpenBrowser(bool value) => linkOpenBrowserSink.add(value);
  set imageOpenBrowser(bool value) => imageOpenBrowserSink.add(value);
  set hideCommentLink(bool value) => hideCommentLinkSink.add(value);
  set splitVotesLink(bool value) => splitVotesLinkSink.add(value);
  set hideAdultImage(bool value) => hideAdultImageSink.add(value);
  set expandNewbieContent(bool value) => expandNewbieContentSink.add(value);
  set expandNoTagContent(bool value) => expandNoTagContentSink.add(value);
  set hideExpandContent(bool value) => hideExpandContentSink.add(value);
  set confirmDelete(bool value) => confirmDeleteSink.add(value);
  set confirmSend(bool value) => confirmSendSink.add(value);
  set confirmExitWriting(bool value) => confirmExitWritingSink.add(value);
  set confirmExitApp(bool value) => confirmExitAppSink.add(value);
  void dispose() {
    useDarkThemeSink.close();
    autoDarkThemeSink.close();
    autoDarkThemeTimeFromSink.close();
    autoDarkThemeTimeToSink.close();
    simpleLinkViewSink.close();
    accentColorSink.close();
    useYoutubePlayerSink.close();
    useOtherPlayerSink.close();
    useAutoplaySink.close();
    highResAvatarSink.close();
    highResImageSink.close();
    hiddingLinkThumbSink.close();
    hiddingEntryImageSink.close();
    hiddingCommentImageSink.close();
    shortLongPictureSink.close();
    skipExpandImageSink.close();
    skipShowAdultImageSink.close();
    shortLongBodySink.close();
    hideSpoilerTextSink.close();
    openSpoilerDialogSink.close();
    textSizeSink.close();
    useNotificationSink.close();
    usePushNotificationSink.close();
    timeCheckNotificationSink.close();
    useSoundNotificationSink.close();
    useVibrationNotificationSink.close();
    useSoundAppSink.close();
    defaultAppScreenSink.close();
    defaultLinkScreenSink.close();
    defaultEntryScreenSink.close();
    defaultMyWykopScreenSink.close();
    defaultNotificationScreenSink.close();
    linkOpenBrowserSink.close();
    imageOpenBrowserSink.close();
    hideCommentLinkSink.close();
    splitVotesLinkSink.close();
    hideAdultImageSink.close();
    expandNewbieContentSink.close();
    expandNoTagContentSink.close();
    hideExpandContentSink.close();
    confirmDeleteSink.close();
    confirmSendSink.close();
    confirmExitWritingSink.close();
    confirmExitAppSink.close();
  }
}

abstract class OWMSettingsPreferences {
  Sink<bool> useDarkThemeSink;

  Sink<int> autoDarkThemeSink;

  Sink<String> autoDarkThemeTimeFromSink;

  Sink<String> autoDarkThemeTimeToSink;

  Sink<bool> simpleLinkViewSink;

  Sink<int> accentColorSink;

  Sink<bool> useYoutubePlayerSink;

  Sink<bool> useOtherPlayerSink;

  Sink<int> useAutoplaySink;

  Sink<bool> highResAvatarSink;

  Sink<bool> highResImageSink;

  Sink<bool> hiddingLinkThumbSink;

  Sink<bool> hiddingEntryImageSink;

  Sink<bool> hiddingCommentImageSink;

  Sink<bool> shortLongPictureSink;

  Sink<bool> skipExpandImageSink;

  Sink<bool> skipShowAdultImageSink;

  Sink<bool> shortLongBodySink;

  Sink<bool> hideSpoilerTextSink;

  Sink<bool> openSpoilerDialogSink;

  Sink<double> textSizeSink;

  Sink<bool> useNotificationSink;

  Sink<bool> usePushNotificationSink;

  Sink<int> timeCheckNotificationSink;

  Sink<bool> useSoundNotificationSink;

  Sink<bool> useVibrationNotificationSink;

  Sink<bool> useSoundAppSink;

  Sink<int> defaultAppScreenSink;

  Sink<int> defaultLinkScreenSink;

  Sink<int> defaultEntryScreenSink;

  Sink<int> defaultMyWykopScreenSink;

  Sink<int> defaultNotificationScreenSink;

  Sink<bool> linkOpenBrowserSink;

  Sink<bool> imageOpenBrowserSink;

  Sink<bool> hideCommentLinkSink;

  Sink<bool> splitVotesLinkSink;

  Sink<bool> hideAdultImageSink;

  Sink<bool> expandNewbieContentSink;

  Sink<bool> expandNoTagContentSink;

  Sink<bool> hideExpandContentSink;

  Sink<bool> confirmDeleteSink;

  Sink<bool> confirmSendSink;

  Sink<bool> confirmExitWritingSink;

  Sink<bool> confirmExitAppSink;

  Stream<bool> get useDarkThemeStream;
  Stream<int> get autoDarkThemeStream;
  Stream<String> get autoDarkThemeTimeFromStream;
  Stream<String> get autoDarkThemeTimeToStream;
  Stream<bool> get simpleLinkViewStream;
  Stream<int> get accentColorStream;
  Stream<bool> get useYoutubePlayerStream;
  Stream<bool> get useOtherPlayerStream;
  Stream<int> get useAutoplayStream;
  Stream<bool> get highResAvatarStream;
  Stream<bool> get highResImageStream;
  Stream<bool> get hiddingLinkThumbStream;
  Stream<bool> get hiddingEntryImageStream;
  Stream<bool> get hiddingCommentImageStream;
  Stream<bool> get shortLongPictureStream;
  Stream<bool> get skipExpandImageStream;
  Stream<bool> get skipShowAdultImageStream;
  Stream<bool> get shortLongBodyStream;
  Stream<bool> get hideSpoilerTextStream;
  Stream<bool> get openSpoilerDialogStream;
  Stream<double> get textSizeStream;
  Stream<bool> get useNotificationStream;
  Stream<bool> get usePushNotificationStream;
  Stream<int> get timeCheckNotificationStream;
  Stream<bool> get useSoundNotificationStream;
  Stream<bool> get useVibrationNotificationStream;
  Stream<bool> get useSoundAppStream;
  Stream<int> get defaultAppScreenStream;
  Stream<int> get defaultLinkScreenStream;
  Stream<int> get defaultEntryScreenStream;
  Stream<int> get defaultMyWykopScreenStream;
  Stream<int> get defaultNotificationScreenStream;
  Stream<bool> get linkOpenBrowserStream;
  Stream<bool> get imageOpenBrowserStream;
  Stream<bool> get hideCommentLinkStream;
  Stream<bool> get splitVotesLinkStream;
  Stream<bool> get hideAdultImageStream;
  Stream<bool> get expandNewbieContentStream;
  Stream<bool> get expandNoTagContentStream;
  Stream<bool> get hideExpandContentStream;
  Stream<bool> get confirmDeleteStream;
  Stream<bool> get confirmSendStream;
  Stream<bool> get confirmExitWritingStream;
  Stream<bool> get confirmExitAppStream;
  void dispose() {
    useDarkThemeSink.close();
    autoDarkThemeSink.close();
    autoDarkThemeTimeFromSink.close();
    autoDarkThemeTimeToSink.close();
    simpleLinkViewSink.close();
    accentColorSink.close();
    useYoutubePlayerSink.close();
    useOtherPlayerSink.close();
    useAutoplaySink.close();
    highResAvatarSink.close();
    highResImageSink.close();
    hiddingLinkThumbSink.close();
    hiddingEntryImageSink.close();
    hiddingCommentImageSink.close();
    shortLongPictureSink.close();
    skipExpandImageSink.close();
    skipShowAdultImageSink.close();
    shortLongBodySink.close();
    hideSpoilerTextSink.close();
    openSpoilerDialogSink.close();
    textSizeSink.close();
    useNotificationSink.close();
    usePushNotificationSink.close();
    timeCheckNotificationSink.close();
    useSoundNotificationSink.close();
    useVibrationNotificationSink.close();
    useSoundAppSink.close();
    defaultAppScreenSink.close();
    defaultLinkScreenSink.close();
    defaultEntryScreenSink.close();
    defaultMyWykopScreenSink.close();
    defaultNotificationScreenSink.close();
    linkOpenBrowserSink.close();
    imageOpenBrowserSink.close();
    hideCommentLinkSink.close();
    splitVotesLinkSink.close();
    hideAdultImageSink.close();
    expandNewbieContentSink.close();
    expandNoTagContentSink.close();
    hideExpandContentSink.close();
    confirmDeleteSink.close();
    confirmSendSink.close();
    confirmExitWritingSink.close();
    confirmExitAppSink.close();
  }
}
