import 'package:built_value/built_value.dart';
import 'package:wolkflow/models/models.dart';
import 'package:wolkflow/api/api.dart';

part 'entry_comment.g.dart';

abstract class EntryComment
    implements Built<EntryComment, EntryCommentBuilder> {
  int get id;
  String get date;

  @nullable
  String get body;

  int get voteCount;

  bool get isVoted;

  Author get author;

  @nullable
  Embed get embed;

  factory EntryComment.mapFromResponse(EntryCommentResponse response) {
    return _$EntryComment._(
        id: response.id,
        date: response.date,
        body: response.body,
        voteCount: response.voteCount,
        author: Author.fromResponse(response: response.author),
        isVoted: response.userVote != null && response.userVote > 0,
        embed: (response.embed != null
            ? Embed.fromResponse(response: response.embed)
            : null));
  }

  EntryComment._();
}
