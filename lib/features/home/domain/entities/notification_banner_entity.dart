/// Priority level for notification banners
enum BannerPriority {
  /// High priority - usually shown first
  high,

  /// Medium priority - shown after high priority
  medium,

  /// Low priority - shown last
  low,
}

/// Entity representing a notification banner
/// 
/// This is a pure Dart class representing health campaign notifications
/// displayed on the home dashboard.
class NotificationBannerEntity {
  /// Unique identifier for the banner
  final String id;

  /// French title for the banner
  final String titleFr;

  /// Arabic title for the banner
  final String titleAr;

  /// French body text for the banner
  final String bodyFr;

  /// Arabic body text for the banner
  final String bodyAr;

  /// Emoji icon to display in the banner (e.g., "🏥")
  final String iconEmoji;

  /// Route path to navigate to when banner is tapped
  /// Null if the banner is not tappable
  final String? actionRoute;

  /// Priority level for banner display ordering
  final BannerPriority priority;

  /// Expiration date for the banner
  /// Null if the banner does not expire
  final DateTime? expiresAt;

  /// Creates a NotificationBannerEntity instance
  const NotificationBannerEntity({
    required this.id,
    required this.titleFr,
    required this.titleAr,
    required this.bodyFr,
    required this.bodyAr,
    required this.iconEmoji,
    required this.actionRoute,
    required this.priority,
    required this.expiresAt,
  });

  /// Checks if the banner has expired
  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt!);
  }

  /// Helper to check if banner is expired
  static bool checkIfExpired(DateTime? expiresAt) {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationBannerEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          titleFr == other.titleFr &&
          titleAr == other.titleAr &&
          bodyFr == other.bodyFr &&
          bodyAr == other.bodyAr &&
          iconEmoji == other.iconEmoji &&
          actionRoute == other.actionRoute &&
          priority == other.priority &&
          expiresAt == other.expiresAt;

  @override
  int get hashCode =>
      id.hashCode ^
      titleFr.hashCode ^
      titleAr.hashCode ^
      bodyFr.hashCode ^
      bodyAr.hashCode ^
      iconEmoji.hashCode ^
      actionRoute.hashCode ^
      priority.hashCode ^
      expiresAt.hashCode;

  @override
  String toString() =>
      'NotificationBannerEntity(id: $id, titleFr: $titleFr, titleAr: $titleAr, '
      'priority: $priority, isExpired: $isExpired)';
}
