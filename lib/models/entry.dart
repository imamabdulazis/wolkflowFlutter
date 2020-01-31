import 'package:built_value/built_value.dart';
import 'package:wolkflow/models/models.dart';
import 'package:wolkflow/api/api.dart';
import 'package:built_collection/built_collection.dart';

part 'entry.g.dart';

abstract class Entry implements Built<Entry, EntryBuilder> {
  int get id;
  String get date;

  @nullable
  String get body;

  int get voteCount;

  int get commentsCount;

  bool get isVoted;

  BuiltList<EntryComment> get comments;

  Author get author;

  @nullable
  Embed get embed;

  factory Entry.mapFromResponse(EntryResponse response) {
    return _$Entry._(
        id: response.id,
        date: response.date,
        body: response.body,
        voteCount: response.voteCount,
        commentsCount: response.commentsCount,
        comments: response.comments == null
            ? BuiltList.from([])
            : BuiltList.from(response.comments.map((el) {
                return EntryComment.mapFromResponse(el);
              })),
        isVoted: response.userVote != null && response.userVote > 0,
        author: Author.fromResponse(response: response.author),
        embed: (response.embed != null
            ? Embed.fromResponse(response: response.embed)
            : null));
  }

  Entry._();
}
