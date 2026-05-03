import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:fffff/core/errors/failure.dart';
import 'package:fffff/features/home/domain/entities/home_stats_entity.dart';
import 'package:fffff/features/home/domain/repositories/home_repository.dart';
import 'package:fffff/features/home/domain/usecases/get_home_stats_usecase.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late GetHomeStatsUsecase usecase;
  late MockHomeRepository mockRepository;

  setUp(() {
    mockRepository = MockHomeRepository();
    usecase = GetHomeStatsUsecase(repository: mockRepository);
  });

  group('GetHomeStatsUsecase', () {
    test(
      'should return HomeStatsEntity from repository on success',
      () async {
        // Arrange
        final stats = const HomeStatsEntity(
          totalAssessmentsCompleted: 2,
          nearestCenterDistance: 3.5,
          lastChatMessageAt: null,
          unreadNotificationsCount: 1,
        );
        when(() => mockRepository.getHomeStats())
            .thenAnswer((_) async => Right(stats));

        // Act
        final result = await usecase();

        // Assert
        expect(result, Right(stats));
        verify(() => mockRepository.getHomeStats()).called(1);
      },
    );

    test(
      'should return NetworkFailure when repository fails',
      () async {
        // Arrange
        final failure = NetworkFailure(message: 'Network error');
        when(() => mockRepository.getHomeStats())
            .thenAnswer((_) async => Left(failure));

        // Act
        final result = await usecase();

        // Assert
        expect(result, Left(failure));
      },
    );

    test(
      'should return stats with zero assessments on first visit',
      () async {
        // Arrange
        final stats = const HomeStatsEntity(
          totalAssessmentsCompleted: 0,
          nearestCenterDistance: null,
          lastChatMessageAt: null,
          unreadNotificationsCount: 0,
        );
        when(() => mockRepository.getHomeStats())
            .thenAnswer((_) async => Right(stats));

        // Act
        final result = await usecase();

        // Assert
        expect(result, Right(stats));
        result.fold(
          (_) => fail('Expected Right'),
          (data) {
            expect(data.totalAssessmentsCompleted, 0);
            expect(data.nearestCenterDistance, isNull);
            expect(data.lastChatMessageAt, isNull);
            expect(data.unreadNotificationsCount, 0);
          },
        );
      },
    );

    test(
      'should handle all stat fields correctly',
      () async {
        // Arrange
        final now = DateTime.now();
        final stats = HomeStatsEntity(
          totalAssessmentsCompleted: 5,
          nearestCenterDistance: 12.5,
          lastChatMessageAt: now,
          unreadNotificationsCount: 3,
        );
        when(() => mockRepository.getHomeStats())
            .thenAnswer((_) async => Right(stats));

        // Act
        final result = await usecase();

        // Assert
        result.fold(
          (_) => fail('Expected Right'),
          (data) {
            expect(data.totalAssessmentsCompleted, 5);
            expect(data.nearestCenterDistance, 12.5);
            expect(data.lastChatMessageAt, now);
            expect(data.unreadNotificationsCount, 3);
          },
        );
      },
    );
  });
}
