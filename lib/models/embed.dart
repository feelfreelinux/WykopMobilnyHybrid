import 'package:built_value/built_value.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/models/models.dart';

part 'embed.g.dart';

abstract class Embed implements Built<Embed, EmbedBuilder> {
  String get preview;
  String get url;
  @nullable
  bool get plus18;

  factory Embed.fromResponse({EmbedResponse response}) {
    return _$Embed._(
        preview: response.preview, url: response.url, plus18: response.plus18);
  }

  Embed._();
}
