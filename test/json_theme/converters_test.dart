import 'package:owmflutter/json_theme/json_theme_converters.dart';
import 'package:test/test.dart';

void main() {
  test('Color converter converts hex string to color', () {
    var col = JsonThemeConverters.convertColor("#ff00ff00");
    expect(col.alpha, 255);
    expect(col.red, 0);
    expect(col.green, 255);
    expect(col.blue, 0);
  });
}
