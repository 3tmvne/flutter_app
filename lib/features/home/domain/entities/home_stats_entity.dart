/// Entity representing home dashboard statistics
/// 
/// This is a pure Dart class with no Flutter imports or dependencies.
/// It represents the core data model for home statistics.
class HomeStatsEntity {
  /// Total number of assessments completed by the user
  final int totalAssessmentsCompleted;

  /// Distance to the nearest screening center in kilometers
  /// Null if the user has never used GPS to find centers
  final double? nearestCenterDistance;

  /// Timestamp of the last chat message from the user
  /// Null if the user has never used the chatbot
  final DateTime? lastChatMessageAt;

  /// Count of unread notifications
  final int unreadNotificationsCount;

  /// Creates a HomeStatsEntity instance
  const HomeStatsEntity({
    required this.totalAssessmentsCompleted,
    required this.nearestCenterDistance,
    required this.lastChatMessageAt,
    required this.unreadNotificationsCount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeStatsEntity &&
          runtimeType == other.runtimeType &&
          totalAssessmentsCompleted == other.totalAssessmentsCompleted &&
          nearestCenterDistance == other.nearestCenterDistance &&
          lastChatMessageAt == other.lastChatMessageAt &&
          unreadNotificationsCount == other.unreadNotificationsCount;

  @override
  int get hashCode =>
      totalAssessmentsCompleted.hashCode ^
      nearestCenterDistance.hashCode ^
      lastChatMessageAt.hashCode ^
      unreadNotificationsCount.hashCode;

  @override
  String toString() =>
      'HomeStatsEntity(totalAssessmentsCompleted: $totalAssessmentsCompleted, '
      'nearestCenterDistance: $nearestCenterDistance, '
      'lastChatMessageAt: $lastChatMessageAt, '
      'unreadNotificationsCount: $unreadNotificationsCount)';
}
