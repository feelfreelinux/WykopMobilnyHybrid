import 'package:built_value/built_value.dart';
import 'package:owmflutter/api/api.dart';

part 'embed.g.dart';

abstract class Embed implements Built<Embed, EmbedBuilder> {
  String get preview;
  String get url;
  String get type;
  bool get isAnimated;
  @nullable
  bool get plus18;

  factory Embed.fromResponse({EmbedResponse response}) {
    return _$Embed._(
        preview: response.preview,
        url: response.url,
        plus18: response.plus18,
        type: response.type,
        isAnimated: response.animated);
  }

  Embed._();
}
