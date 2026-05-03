import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:fffff/core/errors/failure.dart';
import 'package:fffff/features/home/domain/entities/home_stats_entity.dart';
import 'package:fffff/features/home/domain/entities/notification_banner_entity.dart';
import 'package:fffff/features/home/domain/usecases/get_home_stats_usecase.dart';
import 'package:fffff/features/home/domain/usecases/get_notification_banners_usecase.dart';
import 'package:fffff/features/home/presentation/notifier/home_notifier.dart';
import 'package:fffff/features/home/presentation/notifier/home_state.dart';

class MockGetHomeStatsUsecase extends Mock implements GetHomeStatsUsecase {}

class MockGetNotificationBannersUsecase extends Mock
    implements GetNotificationBannersUsecase {}

void main() {
  late ProviderContainer container;
  late MockGetHomeStatsUsecase mockGetStats;
  late MockGetNotificationBannersUsecase mockGetBanners;

  setUp(() {
    mockGetStats = MockGetHomeStatsUsecase();
    mockGetBanners = MockGetNotificationBannersUsecase();

    container = ProviderContainer(
      overrides: [
        getHomeStatsUsecaseProvider.overrideWithValue(mockGetStats),
        getNotificationBannersUsecaseProvider.overrideWithValue(mockGetBanners),
      ],
    );
  });

  tearDown(() => container.dispose());

  group('HomeNotifier', () {
    test('loads stats and banners on build', () async {
      // Arrange
      final stats = const HomeStatsEntity(
        totalAssessmentsCompleted: 1,
        nearestCenterDistance: null,
        lastChatMessageAt: null,
        unreadNotificationsCount: 0,
      );
      when(() => mockGetStats()).thenAnswer((_) async => Right(stats));
      when(() => mockGetBanners()).thenAnswer((_) async => const Right([]));

      // Act
      final result = await container.read(homeNotifierProvider.future);

      // Assert
      expect(result.homeStats, stats);
      expect(result.banners, isEmpty);
      expect(result.isLoadingStats, isFalse);
      expect(result.isLoadingBanners, isFalse);
      expect(result.statsError, isNull);
      expect(result.bannersError, isNull);
    });

    test('handles stats error correctly', () async {
      // Arrange
      final failure = NetworkFailure(message: 'Network failed');
      when(() => mockGetStats()).thenAnswer((_) async => Left(failure));
      when(() => mockGetBanners()).thenAnswer((_) async => const Right([]));

      // Act
      final result = await container.read(homeNotifierProvider.future);

      // Assert
      expect(result.homeStats, isNull);
      expect(result.statsError, failure);
      expect(result.isLoadingStats, isFalse);
    });

    test('handles banners error correctly', () async {
      // Arrange
      final stats = const HomeStatsEntity(
        totalAssessmentsCompleted: 0,
        nearestCenterDistance: null,
        lastChatMessageAt: null,
        unreadNotificationsCount: 0,
      );
      final failure = NetworkFailure(message: 'Network failed');
      when(() => mockGetStats()).thenAnswer((_) async => Right(stats));
      when(() => mockGetBanners()).thenAnswer((_) async => Left(failure));

      // Act
      final result = await container.read(homeNotifierProvider.future);

      // Assert
      expect(result.banners, isEmpty);
      expect(result.bannersError, failure);
      expect(result.isLoadingBanners, isFalse);
    });

    test('selectFeature sets and clears selectedFeature', () async {
      // Arrange
      when(() => mockGetStats())
          .thenAnswer((_) async => const Right(HomeStatsEntity(
            totalAssessmentsCompleted: 0,
            nearestCenterDistance: null,
            lastChatMessageAt: null,
            unreadNotificationsCount: 0,
          )));
      when(() => mockGetBanners()).thenAnswer((_) async => const Right([]));
      await container.read(homeNotifierProvider.future);

      // Act
      container
          .read(homeNotifierProvider.notifier)
          .selectFeature(HomeFeature.assessment);

      // Assert - immediate selection
      expect(
        container.read(homeNotifierProvider).value!.selectedFeature,
        HomeFeature.assessment,
      );

      // Wait for auto-clear
      await Future.delayed(const Duration(milliseconds: 200));

      // Assert - selection cleared
      expect(
        container.read(homeNotifierProvider).value!.selectedFeature,
        isNull,
      );
    });

    test('dismissBanner removes banner from list', () async {
      // Arrange
      final banner = NotificationBannerEntity(
        id: 'test-banner-1',
        titleFr: 'Test Title',
        titleAr: 'عنوان الاختبار',
        bodyFr: 'Test body',
        bodyAr: 'نص الاختبار',
        iconEmoji: '🏥',
        actionRoute: null,
        priority: BannerPriority.medium,
        expiresAt: null,
      );
      when(() => mockGetStats())
          .thenAnswer((_) async => const Right(HomeStatsEntity(
            totalAssessmentsCompleted: 0,
            nearestCenterDistance: null,
            lastChatMessageAt: null,
            unreadNotificationsCount: 0,
          )));
      when(() => mockGetBanners())
          .thenAnswer((_) async => Right([banner]));
      await container.read(homeNotifierProvider.future);

      // Act
      container
          .read(homeNotifierProvider.notifier)
          .dismissBanner('test-banner-1');

      // Assert
      expect(
        container.read(homeNotifierProvider).value!.banners,
        isEmpty,
      );
    });

    test('refreshStats updates stats', () async {
      // Arrange
      final initialStats = const HomeStatsEntity(
        totalAssessmentsCompleted: 1,
        nearestCenterDistance: null,
        lastChatMessageAt: null,
        unreadNotificationsCount: 0,
      );
      final updatedStats = const HomeStatsEntity(
        totalAssessmentsCompleted: 2,
        nearestCenterDistance: 5.0,
        lastChatMessageAt: null,
        unreadNotificationsCount: 1,
      );
      when(() => mockGetStats())
          .thenAnswer((_) async => Right(initialStats));
      when(() => mockGetBanners()).thenAnswer((_) async => const Right([]));
      await container.read(homeNotifierProvider.future);

      // Act
      when(() => mockGetStats())
          .thenAnswer((_) async => Right(updatedStats));
      await container
          .read(homeNotifierProvider.notifier)
          .refreshStats();

      // Assert
      expect(
        container.read(homeNotifierProvider).value!.homeStats,
        updatedStats,
      );
    });

    test('refreshBanners updates banners list', () async {
      // Arrange
      final banner1 = NotificationBannerEntity(
        id: 'banner-1',
        titleFr: 'Banner 1',
        titleAr: 'لافتة 1',
        bodyFr: 'Body 1',
        bodyAr: 'النص 1',
        iconEmoji: '🏥',
        actionRoute: null,
        priority: BannerPriority.high,
        expiresAt: null,
      );
      final banner2 = NotificationBannerEntity(
        id: 'banner-2',
        titleFr: 'Banner 2',
        titleAr: 'لافتة 2',
        bodyFr: 'Body 2',
        bodyAr: 'النص 2',
        iconEmoji: '💊',
        actionRoute: null,
        priority: BannerPriority.medium,
        expiresAt: null,
      );
      when(() => mockGetStats())
          .thenAnswer((_) async => const Right(HomeStatsEntity(
            totalAssessmentsCompleted: 0,
            nearestCenterDistance: null,
            lastChatMessageAt: null,
            unreadNotificationsCount: 0,
          )));
      when(() => mockGetBanners())
          .thenAnswer((_) async => Right([banner1]));
      await container.read(homeNotifierProvider.future);

      // Act
      when(() => mockGetBanners())
          .thenAnswer((_) async => Right([banner1, banner2]));
      await container
          .read(homeNotifierProvider.notifier)
          .refreshBanners();

      // Assert
      expect(
        container.read(homeNotifierProvider).value!.banners.length,
        2,
      );
    });
  });
}
