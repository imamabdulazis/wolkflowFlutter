// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LinkResponse> _$linkResponseSerializer =
    new _$LinkResponseSerializer();

class _$LinkResponseSerializer implements StructuredSerializer<LinkResponse> {
  @override
  final Iterable<Type> types = const [LinkResponse, _$LinkResponse];
  @override
  final String wireName = 'LinkResponse';

  @override
  Iterable serialize(Serializers serializers, LinkResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'tags',
      serializers.serialize(object.tags, specifiedType: const FullType(String)),
      'source_url',
      serializers.serialize(object.sourceUrl,
          specifiedType: const FullType(String)),
      'vote_count',
      serializers.serialize(object.voteCount,
          specifiedType: const FullType(int)),
      'comments_count',
      serializers.serialize(object.commentsCount,
          specifiedType: const FullType(int)),
      'related_count',
      serializers.serialize(object.relatedCount,
          specifiedType: const FullType(int)),
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(AuthorResponse)),
      'is_hot',
      serializers.serialize(object.isHot, specifiedType: const FullType(bool)),
      'can_vote',
      serializers.serialize(object.canVote,
          specifiedType: const FullType(bool)),
    ];
    if (object.preview != null) {
      result
        ..add('preview')
        ..add(serializers.serialize(object.preview,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  LinkResponse deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LinkResponseBuilder();

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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tags':
          result.tags = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'source_url':
          result.sourceUrl = serializers.deserialize(value,
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
        case 'related_count':
          result.relatedCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'author':
          result.author.replace(serializers.deserialize(value,
              specifiedType: const FullType(AuthorResponse)) as AuthorResponse);
          break;
        case 'preview':
          result.preview = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'is_hot':
          result.isHot = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'can_vote':
          result.canVote = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$LinkResponse extends LinkResponse {
  @override
  final int id;
  @override
  final String date;
  @override
  final String title;
  @override
  final String description;
  @override
  final String tags;
  @override
  final String sourceUrl;
  @override
  final int voteCount;
  @override
  final int commentsCount;
  @override
  final int relatedCount;
  @override
  final AuthorResponse author;
  @override
  final String preview;
  @override
  final bool isHot;
  @override
  final bool canVote;

  factory _$LinkResponse([void updates(LinkResponseBuilder b)]) =>
      (new LinkResponseBuilder()..update(updates)).build();

  _$LinkResponse._(
      {this.id,
      this.date,
      this.title,
      this.description,
      this.tags,
      this.sourceUrl,
      this.voteCount,
      this.commentsCount,
      this.relatedCount,
      this.author,
      this.preview,
      this.isHot,
      this.canVote})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('LinkResponse', 'id');
    }
    if (date == null) {
      throw new BuiltValueNullFieldError('LinkResponse', 'date');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('LinkResponse', 'title');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('LinkResponse', 'description');
    }
    if (tags == null) {
      throw new BuiltValueNullFieldError('LinkResponse', 'tags');
    }
    if (sourceUrl == null) {
      throw new BuiltValueNullFieldError('LinkResponse', 'sourceUrl');
    }
    if (voteCount == null) {
      throw new BuiltValueNullFieldError('LinkResponse', 'voteCount');
    }
    if (commentsCount == null) {
      throw new BuiltValueNullFieldError('LinkResponse', 'commentsCount');
    }
    if (relatedCount == null) {
      throw new BuiltValueNullFieldError('LinkResponse', 'relatedCount');
    }
    if (author == null) {
      throw new BuiltValueNullFieldError('LinkResponse', 'author');
    }
    if (isHot == null) {
      throw new BuiltValueNullFieldError('LinkResponse', 'isHot');
    }
    if (canVote == null) {
      throw new BuiltValueNullFieldError('LinkResponse', 'canVote');
    }
  }

  @override
  LinkResponse rebuild(void updates(LinkResponseBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  LinkResponseBuilder toBuilder() => new LinkResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LinkResponse &&
        id == other.id &&
        date == other.date &&
        title == other.title &&
        description == other.description &&
        tags == other.tags &&
        sourceUrl == other.sourceUrl &&
        voteCount == other.voteCount &&
        commentsCount == other.commentsCount &&
        relatedCount == other.relatedCount &&
        author == other.author &&
        preview == other.preview &&
        isHot == other.isHot &&
        canVote == other.canVote;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, id.hashCode),
                                                    date.hashCode),
                                                title.hashCode),
                                            description.hashCode),
                                        tags.hashCode),
                                    sourceUrl.hashCode),
                                voteCount.hashCode),
                            commentsCount.hashCode),
                        relatedCount.hashCode),
                    author.hashCode),
                preview.hashCode),
            isHot.hashCode),
        canVote.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LinkResponse')
          ..add('id', id)
          ..add('date', date)
          ..add('title', title)
          ..add('description', description)
          ..add('tags', tags)
          ..add('sourceUrl', sourceUrl)
          ..add('voteCount', voteCount)
          ..add('commentsCount', commentsCount)
          ..add('relatedCount', relatedCount)
          ..add('author', author)
          ..add('preview', preview)
          ..add('isHot', isHot)
          ..add('canVote', canVote))
        .toString();
  }
}

class LinkResponseBuilder
    implements Builder<LinkResponse, LinkResponseBuilder> {
  _$LinkResponse _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _tags;
  String get tags => _$this._tags;
  set tags(String tags) => _$this._tags = tags;

  String _sourceUrl;
  String get sourceUrl => _$this._sourceUrl;
  set sourceUrl(String sourceUrl) => _$this._sourceUrl = sourceUrl;

  int _voteCount;
  int get voteCount => _$this._voteCount;
  set voteCount(int voteCount) => _$this._voteCount = voteCount;

  int _commentsCount;
  int get commentsCount => _$this._commentsCount;
  set commentsCount(int commentsCount) => _$this._commentsCount = commentsCount;

  int _relatedCount;
  int get relatedCount => _$this._relatedCount;
  set relatedCount(int relatedCount) => _$this._relatedCount = relatedCount;

  AuthorResponseBuilder _author;
  AuthorResponseBuilder get author =>
      _$this._author ??= new AuthorResponseBuilder();
  set author(AuthorResponseBuilder author) => _$this._author = author;

  String _preview;
  String get preview => _$this._preview;
  set preview(String preview) => _$this._preview = preview;

  bool _isHot;
  bool get isHot => _$this._isHot;
  set isHot(bool isHot) => _$this._isHot = isHot;

  bool _canVote;
  bool get canVote => _$this._canVote;
  set canVote(bool canVote) => _$this._canVote = canVote;

  LinkResponseBuilder();

  LinkResponseBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _date = _$v.date;
      _title = _$v.title;
      _description = _$v.description;
      _tags = _$v.tags;
      _sourceUrl = _$v.sourceUrl;
      _voteCount = _$v.voteCount;
      _commentsCount = _$v.commentsCount;
      _relatedCount = _$v.relatedCount;
      _author = _$v.author?.toBuilder();
      _preview = _$v.preview;
      _isHot = _$v.isHot;
      _canVote = _$v.canVote;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LinkResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LinkResponse;
  }

  @override
  void update(void updates(LinkResponseBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$LinkResponse build() {
    _$LinkResponse _$result;
    try {
      _$result = _$v ??
          new _$LinkResponse._(
              id: id,
              date: date,
              title: title,
              description: description,
              tags: tags,
              sourceUrl: sourceUrl,
              voteCount: voteCount,
              commentsCount: commentsCount,
              relatedCount: relatedCount,
              author: author.build(),
              preview: preview,
              isHot: isHot,
              canVote: canVote);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'author';
        author.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LinkResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
