import 'package:built_value/built_value.dart';

import 'package:built_value/serializer.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/models/models.dart';

part 'suggestions_state.g.dart';

abstract class SuggestionsState implements Built<SuggestionsState, SuggestionsStateBuilder> {
  List<AuthorSuggestion> get authorSuggestions;
  List<TagSuggestion> get tagSuggestions;

  factory SuggestionsState() {
    return _$SuggestionsState._(
        tagSuggestions: [],
        authorSuggestions: []);
  }

  SuggestionsState._();
  static Serializer<SuggestionsState> get serializer => _$suggestionsStateSerializer;
}
