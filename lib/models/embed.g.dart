// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'embed.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Embed extends Embed {
  @override
  final String preview;
  @override
  final String url;
  @override
  final String type;
  @override
  final bool isAnimated;
  @override
  final bool plus18;

  factory _$Embed([void updates(EmbedBuilder b)]) =>
      (new EmbedBuilder()..update(updates)).build();

  _$Embed._({this.preview, this.url, this.type, this.isAnimated, this.plus18})
      : super._() {
    if (preview == null) {
      throw new BuiltValueNullFieldError('Embed', 'preview');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('Embed', 'url');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('Embed', 'type');
    }
    if (isAnimated == null) {
      throw new BuiltValueNullFieldError('Embed', 'isAnimated');
    }
  }

  @override
  Embed rebuild(void updates(EmbedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  EmbedBuilder toBuilder() => new EmbedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Embed &&
        preview == other.preview &&
        url == other.url &&
        type == other.type &&
        isAnimated == other.isAnimated &&
        plus18 == other.plus18;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, preview.hashCode), url.hashCode), type.hashCode),
            isAnimated.hashCode),
        plus18.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Embed')
          ..add('preview', preview)
          ..add('url', url)
          ..add('type', type)
          ..add('isAnimated', isAnimated)
          ..add('plus18', plus18))
        .toString();
  }
}

class EmbedBuilder implements Builder<Embed, EmbedBuilder> {
  _$Embed _$v;

  String _preview;
  String get preview => _$this._preview;
  set preview(String preview) => _$this._preview = preview;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  bool _isAnimated;
  bool get isAnimated => _$this._isAnimated;
  set isAnimated(bool isAnimated) => _$this._isAnimated = isAnimated;

  bool _plus18;
  bool get plus18 => _$this._plus18;
  set plus18(bool plus18) => _$this._plus18 = plus18;

  EmbedBuilder();

  EmbedBuilder get _$this {
    if (_$v != null) {
      _preview = _$v.preview;
      _url = _$v.url;
      _type = _$v.type;
      _isAnimated = _$v.isAnimated;
      _plus18 = _$v.plus18;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Embed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Embed;
  }

  @override
  void update(void updates(EmbedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Embed build() {
    final _$result = _$v ??
        new _$Embed._(
            preview: preview,
            url: url,
            type: type,
            isAnimated: isAnimated,
            plus18: plus18);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
