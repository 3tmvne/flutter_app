import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fffff/core/errors/failure.dart';
import 'package:fffff/features/home/domain/entities/home_stats_entity.dart';
import 'package:fffff/features/home/domain/entities/notification_banner_entity.dart';

part 'home_state.freezed.dart';

/// Enum for available home features
enum HomeFeature {
  /// Risk assessment feature
  assessment,

  /// Screening centers locator
  centers,

  /// Health chatbot
  chatbot,

  /// Educational content
  content,
}

/// State class for home dashboard
@freezed
class HomeState with _$HomeState {
  /// Creates a HomeState instance
  const factory HomeState({
    /// Current home statistics
    required HomeStatsEntity? homeStats,

    /// List of active notification banners
    required List<NotificationBannerEntity> banners,

    /// Currently selected feature for animation feedback
    required HomeFeature? selectedFeature,

    /// Loading state for stats
    required bool isLoadingStats,

    /// Loading state for banners
    required bool isLoadingBanners,

    /// Error state for stats
    required Failure? statsError,

    /// Error state for banners
    required Failure? bannersError,
  }) = _HomeState;
}

/// Default/initial state for home
extension HomeStateX on HomeState {
  /// Check if any loading is in progress
  bool get isLoading => isLoadingStats || isLoadingBanners;

  /// Check if there are any errors
  bool get hasError => statsError != null || bannersError != null;
}
