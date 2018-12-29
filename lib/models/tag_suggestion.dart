import 'package:built_value/built_value.dart';
import 'package:owmflutter/api/api.dart';

part 'tag_suggestion.g.dart';

abstract class TagSuggestion implements Built<TagSuggestion, TagSuggestionBuilder> {
  String get tag;
  int get followers;

  factory TagSuggestion.fromResponse({TagSuggestionResponse response}) {
    return _$TagSuggestion._(
        tag: response.tag,
        followers: int.parse(response.followers)) ?? 0;
  }

  TagSuggestion._();
}
