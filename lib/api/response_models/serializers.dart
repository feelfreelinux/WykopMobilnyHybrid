import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/serializer.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/api/response_models/entry_link_response.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  EntryResponse,
  AuthorResponse,
  EmbedResponse,
  EntryCommentResponse,
  LinkResponse,
  EntryLinkResponse
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();