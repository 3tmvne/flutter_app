import 'package:fffff/features/home/data/models/home_stats_model.dart';
import 'package:fffff/features/home/data/models/notification_banner_model.dart';
import 'package:fffff/features/home/domain/entities/home_stats_entity.dart';
import 'package:fffff/features/home/domain/entities/notification_banner_entity.dart';

/// Extension methods to convert models to entities
extension HomeStatsModelToEntity on HomeStatsModel {
  /// Convert HomeStatsModel to HomeStatsEntity
  HomeStatsEntity toEntity() {
    return HomeStatsEntity(
      totalAssessmentsCompleted: totalAssessmentsCompleted,
      nearestCenterDistance: nearestCenterDistance,
      lastChatMessageAt: lastChatMessageAt,
      unreadNotificationsCount: unreadNotificationsCount,
    );
  }
}

/// Extension methods to convert notification banner models to entities
extension NotificationBannerModelToEntity on NotificationBannerModel {
  /// Convert NotificationBannerModel to NotificationBannerEntity
  NotificationBannerEntity toEntity() {
    return NotificationBannerEntity(
      id: id,
      titleFr: titleFr,
      titleAr: titleAr,
      bodyFr: bodyFr,
      bodyAr: bodyAr,
      iconEmoji: iconEmoji,
      actionRoute: actionRoute,
      priority: priority,
      expiresAt: expiresAt,
    );
  }

  /// Checks if the banner has expired
  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt!);
  }
}
