import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fffff/core/di/providers.dart';
import 'package:fffff/core/utils/logger.dart';
import 'package:fffff/features/home/domain/entities/notification_banner_entity.dart';
import 'package:fffff/features/home/presentation/notifier/home_state.dart';

/// AsyncNotifier for managing home dashboard state
class HomeNotifier extends AsyncNotifier<HomeState> {
  @override
  Future<HomeState> build() async {
    logger.i('Building HomeNotifier');
    
    // Get the usecases from providers
    final statsUsecase = await ref.read(getHomeStatsUsecaseProvider.future);
    final bannersUsecase = await ref.read(getNotificationBannersUsecaseProvider.future);
    
    // Load stats and banners in parallel
    final statsResult = await statsUsecase();
    final bannersResult = await bannersUsecase();

    final homeStats = statsResult.fold(
      (failure) {
        logger.w('Failed to load stats: $failure');
        return null;
      },
      (stats) => stats,
    );

    final banners = bannersResult.fold(
      (failure) {
        logger.w('Failed to load banners: $failure');
        return <NotificationBannerEntity>[];
      },
      (list) => list,
    );

    return HomeState(
      homeStats: homeStats,
      banners: banners,
      selectedFeature: null,
      isLoadingStats: false,
      isLoadingBanners: false,
      statsError: statsResult.fold((f) => f, (_) => null),
      bannersError: bannersResult.fold((f) => f, (_) => null),
    );
  }

  /// Refreshes home statistics
  Future<void> refreshStats() async {
    logger.i('Refreshing stats');
    state = const AsyncLoading();

    try {
      final statsUsecase = await ref.read(getHomeStatsUsecaseProvider.future);
      final result = await statsUsecase();
      
      state = AsyncData(
        state.value!.copyWith(
          homeStats: result.fold((_) => null, (stats) => stats),
          isLoadingStats: false,
          statsError: result.fold((f) => f, (_) => null),
        ),
      );
    } catch (e) {
      logger.e('Error refreshing stats: $e');
      state = AsyncData(
        state.value!.copyWith(
          isLoadingStats: false,
        ),
      );
    }
  }

  /// Refreshes notification banners
  Future<void> refreshBanners() async {
    logger.i('Refreshing banners');
    
    try {
      final bannersUsecase = await ref.read(getNotificationBannersUsecaseProvider.future);
      final result = await bannersUsecase();
      
      state = AsyncData(
        state.value!.copyWith(
          banners: result.fold((_) => [], (list) => list),
          isLoadingBanners: false,
          bannersError: result.fold((f) => f, (_) => null),
        ),
      );
    } catch (e) {
      logger.e('Error refreshing banners: $e');
      state = AsyncData(
        state.value!.copyWith(
          isLoadingBanners: false,
        ),
      );
    }
  }

  /// Selects a feature and provides visual feedback
  /// 
  /// The selection is automatically cleared after 150ms for animation purposes.
  void selectFeature(HomeFeature feature) {
    logger.d('Selected feature: $feature');
    
    state = AsyncData(
      state.value!.copyWith(selectedFeature: feature),
    );

    // Auto-clear selection after delay for animation feedback
    Future.delayed(const Duration(milliseconds: 150), () {
      if (state.value != null) {
        state = AsyncData(
          state.value!.copyWith(selectedFeature: null),
        );
      }
    });
  }

  /// Dismisses a notification banner
  /// 
  /// Removes the banner from the UI display list.
  /// This does not persist the dismissal to the backend.
  void dismissBanner(String bannerId) {
    logger.d('Dismissing banner: $bannerId');
    
    final currentBanners = state.value?.banners ?? [];
    final updatedBanners =
        currentBanners.where((b) => b.id != bannerId).toList();

    state = AsyncData(
      state.value!.copyWith(banners: updatedBanners),
    );
  }
}

/// Provider for the HomeNotifier
final homeNotifierProvider =
    AsyncNotifierProvider<HomeNotifier, HomeState>(
  () => HomeNotifier(),
);
