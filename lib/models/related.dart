import 'package:built_value/built_value.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/api/api.dart';

part 'related.g.dart';

abstract class Related implements Built<Related, RelatedBuilder> {
  int get id;
  String get url;

  String get title;

  int get voteCount;

  bool get isVoted;
  Author get author;

  factory Related.mapFromResponse(RelatedResponse response) {
    return _$Related._(
      id: response.id,
      url: response.url,
      title: response.title,
      voteCount: response.voteCount,
      isVoted: false,
      author: Author.fromResponse(response: response.author),
    );
  }

  Related._();
}
