import 'package:pref_gen_annotations/pref_gen_annotations.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

part 'owm_settings.g.dart';

/// A simple class persisting selected settings.
@ReactivePreferencesHolder()
abstract class OWMSettings implements OWMSettingsPreferences {
  @DefaultValue(false)
  bool useDarkTheme;
  @DefaultValue(0)
  int autoDarkTheme;
  @DefaultValue("20:00")
  String autoDarkThemeTimeFrom;
  @DefaultValue("08:00")
  String autoDarkThemeTimeTo;
  @DefaultValue(false)
  bool simpleLinkView;
  @DefaultValue(4280391411)
  int accentColor;
  @DefaultValue([])
  List<String> searchHistory;
  @DefaultValue(true)
  bool useYoutubePlayer;
  @DefaultValue(true)
  bool useOtherPlayer;
  @DefaultValue(0)
  int useAutoplay;
  @DefaultValue(150)
  int resolutionAvatar;
  @DefaultValue(true)
  bool highResImageLink;
  @DefaultValue(false)
  bool highResImage;
  @DefaultValue(false)
  bool hiddingLinkThumb;
  @DefaultValue(false)
  bool hiddingEntryImage;
  @DefaultValue(false)
  bool hiddingCommentImage;
  @DefaultValue(true)
  bool shortLongPicture;
  @DefaultValue(false)
  bool skipExpandImage;
  @DefaultValue(false)
  bool skipShowAdultImage;

  @DefaultValue(true)
  bool shortLongBody;
  @DefaultValue(true)
  bool hideSpoilerText;
  @DefaultValue(false)
  bool openSpoilerDialog;
  @DefaultValue(1.0)
  double textSize;

  @DefaultValue(true)
  bool useNotification;
  @DefaultValue(false)
  bool usePushNotification;
  @DefaultValue(15)
  int timeCheckNotification;
  @DefaultValue(true)
  bool useSoundNotification;
  @DefaultValue(true)
  bool useVibrationNotification;
  @DefaultValue(true)
  bool useSoundApp;

  @DefaultValue(0)
  int defaultAppScreen;
  @DefaultValue(0)
  int defaultLinkScreen;
  @DefaultValue(0)
  int defaultEntryScreen;
  @DefaultValue(0)
  int defaultMyWykopScreen;
  @DefaultValue(0)
  int defaultNotificationScreen;
  @DefaultValue(false)
  bool linkOpenBrowser;
  @DefaultValue(false)
  bool imageOpenBrowser;
  @DefaultValue(false)
  bool hideCommentLink;
  @DefaultValue(false)
  bool splitVotesLink;
  @DefaultValue(true)
  bool hideAdultImage;
  @DefaultValue(false)
  bool expandNewbieContent;
  @DefaultValue(false)
  bool expandNoTagContent;
  @DefaultValue(false)
  bool hideExpandContent;
  @DefaultValue(true)
  bool confirmDelete;
  @DefaultValue(true)
  bool confirmSend;
  @DefaultValue(true)
  bool confirmExitWriting;
  @DefaultValue(true)
  bool confirmExitApp;

  factory OWMSettings(PreferenceAdapter adapter) = _$OWMSettings;
}
