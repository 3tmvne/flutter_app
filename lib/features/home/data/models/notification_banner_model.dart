import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fffff/features/home/domain/entities/notification_banner_entity.dart';

part 'notification_banner_model.freezed.dart';
part 'notification_banner_model.g.dart';

/// Model for notification banners
/// 
/// Extends [NotificationBannerEntity] with JSON serialization support.
/// Used for API communication and local caching.
@freezed
class NotificationBannerModel with _$NotificationBannerModel {
  /// Creates a NotificationBannerModel instance
  const factory NotificationBannerModel({
    required String id,
    @JsonKey(name: 'title_fr') required String titleFr,
    @JsonKey(name: 'title_ar') required String titleAr,
    @JsonKey(name: 'body_fr') required String bodyFr,
    @JsonKey(name: 'body_ar') required String bodyAr,
    @JsonKey(name: 'icon_emoji') required String iconEmoji,
    @JsonKey(name: 'action_route') required String? actionRoute,
    @JsonKey(
      name: 'priority',
      fromJson: _priorityFromJson,
      toJson: _priorityToJson,
    )
    required BannerPriority priority,
    @JsonKey(name: 'expires_at') required DateTime? expiresAt,
  }) = _NotificationBannerModel;

  factory NotificationBannerModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationBannerModelFromJson(json);
}

/// Extension to add entity methods to NotificationBannerModel
extension NotificationBannerModelX on NotificationBannerModel {
  /// Checks if the banner has expired
  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt!);
  }

  /// Convert to entity
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
}

/// Converts string priority to BannerPriority enum
BannerPriority _priorityFromJson(String? value) {
  switch (value?.toLowerCase()) {
    case 'high':
      return BannerPriority.high;
    case 'medium':
      return BannerPriority.medium;
    case 'low':
      return BannerPriority.low;
    default:
      return BannerPriority.medium;
  }
}

/// Converts BannerPriority enum to string
String _priorityToJson(BannerPriority priority) {
  return priority.toString().split('.').last;
}
