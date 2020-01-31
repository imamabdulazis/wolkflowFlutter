import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:wolkflow/models/models.dart';

part 'entities_state.g.dart';

abstract class EntitiesState
    implements Built<EntitiesState, EntitiesStateBuilder> {
  BuiltMap<int, Entry> get entries;
  BuiltMap<int, EntryComment> get entryComments;
  BuiltMap<int, Link> get links;
  BuiltMap<int, LinkComment> get linkComments;
  BuiltMap<int, Notification> get notifications;
  BuiltMap<int, Author> get authorSuggestions;
  BuiltMap<int, Related> get relatedLinks;

  factory EntitiesState() {
    return _$EntitiesState._(
        entries: new BuiltMap<int, Entry>(),
        linkComments: new BuiltMap<int, LinkComment>(),
        relatedLinks: new BuiltMap<int, Related>(),
        links: new BuiltMap<int, Link>(),
        notifications: new BuiltMap<int, Notification>(),
        authorSuggestions: new BuiltMap<int, Author>(),
        entryComments: new BuiltMap<int, EntryComment>());
  }

  EntitiesState._();
  static Serializer<EntitiesState> get serializer => _$entitiesStateSerializer;
}
