import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:wolkflow/api/api.dart';
import 'package:wolkflow/models/models.dart';

part 'notification.g.dart';

abstract class Notification
    implements Built<Notification, NotificationBuilder> {
  factory Notification([updates(NotificationBuilder b)]) = _$Notification;
  int get id;

  String get date;

  @nullable
  String get body;

  @nullable
  @BuiltValueField(wireName: 'item_id')
  String get itemId;

  @nullable
  String get url;

  String get type;

  @nullable
  @BuiltValueField(wireName: 'new')
  bool get isNew;

  @nullable
  Author get author;

  factory Notification.mapFromResponse(NotificationResponse response) {
    return _$Notification._(
      id: response.id,
      date: response.date,
      type: response.type,
      url: response.url,
      body: response.body,
      isNew: response.isNew,
      itemId: response.itemId,
      author: response.author != null
          ? Author.fromResponse(response: response.author)
          : null,
    );
  }

  Notification._();
  static Serializer<Notification> get serializer => _$notificationSerializer;
}
