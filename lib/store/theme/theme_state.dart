import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'theme_state.g.dart';

abstract class ThemeState implements Built<ThemeState, ThemeStateBuilder> {
  OWMTheme get currentTheme;

  factory ThemeState() {
    return _$ThemeState._(currentTheme: OWMTheme.LIGHT_THEME);
  }

  ThemeState._();
  static Serializer<ThemeState> get serializer => _$themeStateSerializer;
}

enum OWMTheme { DARK_THEME, LIGHT_THEME, AMOLED_THEME }
