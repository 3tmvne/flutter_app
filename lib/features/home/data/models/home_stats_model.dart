import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fffff/features/home/domain/entities/home_stats_entity.dart';

part 'home_stats_model.freezed.dart';
part 'home_stats_model.g.dart';

/// Model for home statistics
/// 
/// Extends [HomeStatsEntity] with JSON serialization support.
/// Used for API communication and local caching.
@freezed
class HomeStatsModel with _$HomeStatsModel {
  /// Creates a HomeStatsModel instance
  const factory HomeStatsModel({
    @JsonKey(name: 'total_assessments')
    required int totalAssessmentsCompleted,
    @JsonKey(name: 'nearest_center_km')
    required double? nearestCenterDistance,
    @JsonKey(name: 'last_chat_timestamp')
    required DateTime? lastChatMessageAt,
    @JsonKey(name: 'unread_count')
    required int unreadNotificationsCount,
  }) = _HomeStatsModel;

  factory HomeStatsModel.fromJson(Map<String, dynamic> json) =>
      _$HomeStatsModelFromJson(json);
}
