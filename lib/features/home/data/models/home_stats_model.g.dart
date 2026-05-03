// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeStatsModelImpl _$$HomeStatsModelImplFromJson(Map<String, dynamic> json) =>
    _$HomeStatsModelImpl(
      totalAssessmentsCompleted: (json['total_assessments'] as num).toInt(),
      nearestCenterDistance: (json['nearest_center_km'] as num?)?.toDouble(),
      lastChatMessageAt: json['last_chat_timestamp'] == null
          ? null
          : DateTime.parse(json['last_chat_timestamp'] as String),
      unreadNotificationsCount: (json['unread_count'] as num).toInt(),
    );

Map<String, dynamic> _$$HomeStatsModelImplToJson(
        _$HomeStatsModelImpl instance) =>
    <String, dynamic>{
      'total_assessments': instance.totalAssessmentsCompleted,
      'nearest_center_km': instance.nearestCenterDistance,
      'last_chat_timestamp': instance.lastChatMessageAt?.toIso8601String(),
      'unread_count': instance.unreadNotificationsCount,
    };
