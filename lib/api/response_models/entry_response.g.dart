// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EntryResponse> _$entryResponseSerializer =
    new _$EntryResponseSerializer();

class _$EntryResponseSerializer implements StructuredSerializer<EntryResponse> {
  @override
  final Iterable<Type> types = const [EntryResponse, _$EntryResponse];
  @override
  final String wireName = 'EntryResponse';

  @override
  Iterable serialize(Serializers serializers, EntryResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'vote_count',
      serializers.serialize(object.voteCount,
          specifiedType: const FullType(int)),
      'comments_count',
      serializers.serialize(object.commentsCount,
          specifiedType: const FullType(int)),
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(AuthorResponse)),
    ];
    if (object.userVote != null) {
      result
        ..add('user_vote')
        ..add(serializers.serialize(object.userVote,
            specifiedType: const FullType(int)));
    }
    if (object.comments != null) {
      result
        ..add('comments')
        ..add(serializers.serialize(object.comments,
            specifiedType: const FullType(
                BuiltList, const [const FullType(EntryCommentResponse)])));
    }
    if (object.body != null) {
      result
        ..add('body')
        ..add(serializers.serialize(object.body,
            specifiedType: const FullType(String)));
    }
    if (object.embed != null) {
      result
        ..add('embed')
        ..add(serializers.serialize(object.embed,
            specifiedType: const FullType(EmbedResponse)));
    }

    return result;
  }

  @override
  EntryResponse deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EntryResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user_vote':
          result.userVote = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'comments':
          result.comments.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(EntryCommentResponse)]))
              as BuiltList);
          break;
        case 'body':
          result.body = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'vote_count':
          result.voteCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'comments_count':
          result.commentsCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'author':
          result.author.replace(serializers.deserialize(value,
              specifiedType: const FullType(AuthorResponse)) as AuthorResponse);
          break;
        case 'embed':
          result.embed.replace(serializers.deserialize(value,
              specifiedType: const FullType(EmbedResponse)) as EmbedResponse);
          break;
      }
    }

    return result.build();
  }
}

class _$EntryResponse extends EntryResponse {
  @override
  final int id;
  @override
  final String date;
  @override
  final int userVote;
  @override
  final BuiltList<EntryCommentResponse> comments;
  @override
  final String body;
  @override
  final int voteCount;
  @override
  final int commentsCount;
  @override
  final AuthorResponse author;
  @override
  final EmbedResponse embed;

  factory _$EntryResponse([void updates(EntryResponseBuilder b)]) =>
      (new EntryResponseBuilder()..update(updates)).build();

  _$EntryResponse._(
      {this.id,
      this.date,
      this.userVote,
      this.comments,
      this.body,
      this.voteCount,
      this.commentsCount,
      this.author,
      this.embed})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('EntryResponse', 'id');
    }
    if (date == null) {
      throw new BuiltValueNullFieldError('EntryResponse', 'date');
    }
    if (voteCount == null) {
      throw new BuiltValueNullFieldError('EntryResponse', 'voteCount');
    }
    if (commentsCount == null) {
      throw new BuiltValueNullFieldError('EntryResponse', 'commentsCount');
    }
    if (author == null) {
      throw new BuiltValueNullFieldError('EntryResponse', 'author');
    }
  }

  @override
  EntryResponse rebuild(void updates(EntryResponseBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  EntryResponseBuilder toBuilder() => new EntryResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EntryResponse &&
        id == other.id &&
        date == other.date &&
        userVote == other.userVote &&
        comments == other.comments &&
        body == other.body &&
        voteCount == other.voteCount &&
        commentsCount == other.commentsCount &&
        author == other.author &&
        embed == other.embed;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), date.hashCode),
                                userVote.hashCode),
                            comments.hashCode),
                        body.hashCode),
                    voteCount.hashCode),
                commentsCount.hashCode),
            author.hashCode),
        embed.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EntryResponse')
          ..add('id', id)
          ..add('date', date)
          ..add('userVote', userVote)
          ..add('comments', comments)
          ..add('body', body)
          ..add('voteCount', voteCount)
          ..add('commentsCount', commentsCount)
          ..add('author', author)
          ..add('embed', embed))
        .toString();
  }
}

class EntryResponseBuilder
    implements Builder<EntryResponse, EntryResponseBuilder> {
  _$EntryResponse _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  int _userVote;
  int get userVote => _$this._userVote;
  set userVote(int userVote) => _$this._userVote = userVote;

  ListBuilder<EntryCommentResponse> _comments;
  ListBuilder<EntryCommentResponse> get comments =>
      _$this._comments ??= new ListBuilder<EntryCommentResponse>();
  set comments(ListBuilder<EntryCommentResponse> comments) =>
      _$this._comments = comments;

  String _body;
  String get body => _$this._body;
  set body(String body) => _$this._body = body;

  int _voteCount;
  int get voteCount => _$this._voteCount;
  set voteCount(int voteCount) => _$this._voteCount = voteCount;

  int _commentsCount;
  int get commentsCount => _$this._commentsCount;
  set commentsCount(int commentsCount) => _$this._commentsCount = commentsCount;

  AuthorResponseBuilder _author;
  AuthorResponseBuilder get author =>
      _$this._author ??= new AuthorResponseBuilder();
  set author(AuthorResponseBuilder author) => _$this._author = author;

  EmbedResponseBuilder _embed;
  EmbedResponseBuilder get embed =>
      _$this._embed ??= new EmbedResponseBuilder();
  set embed(EmbedResponseBuilder embed) => _$this._embed = embed;

  EntryResponseBuilder();

  EntryResponseBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _date = _$v.date;
      _userVote = _$v.userVote;
      _comments = _$v.comments?.toBuilder();
      _body = _$v.body;
      _voteCount = _$v.voteCount;
      _commentsCount = _$v.commentsCount;
      _author = _$v.author?.toBuilder();
      _embed = _$v.embed?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EntryResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EntryResponse;
  }

  @override
  void update(void updates(EntryResponseBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$EntryResponse build() {
    _$EntryResponse _$result;
    try {
      _$result = _$v ??
          new _$EntryResponse._(
              id: id,
              date: date,
              userVote: userVote,
              comments: _comments?.build(),
              body: body,
              voteCount: voteCount,
              commentsCount: commentsCount,
              author: author.build(),
              embed: _embed?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'comments';
        _comments?.build();

        _$failedField = 'author';
        author.build();
        _$failedField = 'embed';
        _embed?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'EntryResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
