import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/serializer.dart';
import 'package:wolkflow/api/api.dart';
import 'package:wolkflow/api/response_models/entry_link_response.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  EntryResponse,
  AuthorResponse,
  EmbedResponse,
  EntryCommentResponse,
  LinkResponse,
  LinkCommentResponse,
  NotificationResponse,
  AuthorSuggestionResponse,
  RelatedResponse,
  EntryLinkResponse,
  ConversationResponse,
  PmMessageResponse,
  TagSuggestionResponse,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
