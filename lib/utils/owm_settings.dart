import 'package:pref_gen_annotations/pref_gen_annotations.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

part 'owm_settings.g.dart';

/// A simple class persisting selected settings.
@ReactivePreferencesHolder()
abstract class OWMSettings implements OWMSettingsPreferences {
  @DefaultValue(false)
  bool useDarkTheme;

  factory OWMSettings(PreferenceAdapter adapter) = _$OWMSettings;
}

