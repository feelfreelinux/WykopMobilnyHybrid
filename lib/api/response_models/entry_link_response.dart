import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:owmflutter/api/api.dart';

part 'entry_link_response.g.dart';

/// Represents data returned from the mywykop resource endpoint. It really is a union between link and entry, because the link and entry fields are mutually exclusive.
/// Original kotlin source:
/// https://github.com/feelfreelinux/WykopMobilny/blob/33768ade308a7c065848ab1d9cc84240f8568d7d/app/src/main/kotlin/io/github/feelfreelinux/wykopmobilny/models/mapper/apiv2/EntryLinkMapper.kt
/// https://github.com/feelfreelinux/WykopMobilny/blob/dcbdd2ee45b7c534b0c4d3abe760d44874da3ac7/app/src/main/kotlin/io/github/feelfreelinux/wykopmobilny/models/dataclass/EntryLink.kt
///
abstract class EntryLinkResponse
    implements Built<EntryLinkResponse, EntryLinkResponseBuilder> {
  factory EntryLinkResponse([updates(EntryLinkResponseBuilder b)]) =
      _$EntryLinkResponse;

  @nullable
  LinkResponse get link;

  @nullable
  EntryResponse get entry;

  static Serializer<EntryLinkResponse> get serializer =>
      _$entryLinkResponseSerializer;
  EntryLinkResponse._();
}
