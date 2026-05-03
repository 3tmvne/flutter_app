// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationBannerModelImpl _$$NotificationBannerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationBannerModelImpl(
      id: json['id'] as String,
      titleFr: json['title_fr'] as String,
      titleAr: json['title_ar'] as String,
      bodyFr: json['body_fr'] as String,
      bodyAr: json['body_ar'] as String,
      iconEmoji: json['icon_emoji'] as String,
      actionRoute: json['action_route'] as String?,
      priority: _priorityFromJson(json['priority'] as String?),
      expiresAt: json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String),
    );

Map<String, dynamic> _$$NotificationBannerModelImplToJson(
        _$NotificationBannerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title_fr': instance.titleFr,
      'title_ar': instance.titleAr,
      'body_fr': instance.bodyFr,
      'body_ar': instance.bodyAr,
      'icon_emoji': instance.iconEmoji,
      'action_route': instance.actionRoute,
      'priority': _priorityToJson(instance.priority),
      'expires_at': instance.expiresAt?.toIso8601String(),
    };
