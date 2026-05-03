import 'package:dartz/dartz.dart';
import 'package:fffff/core/errors/failure.dart';
import 'package:fffff/features/home/domain/entities/notification_banner_entity.dart';
import 'package:fffff/features/home/domain/repositories/home_repository.dart';

/// Usecase for fetching active notification banners
/// 
/// Retrieves health campaign banners, filters out expired ones,
/// and sorts them by priority (high → medium → low).
class GetNotificationBannersUsecase {
  /// The repository dependency
  final HomeRepository repository;

  /// Creates an instance of GetNotificationBannersUsecase
  const GetNotificationBannersUsecase({required this.repository});

  /// Executes the usecase
  /// 
  /// Returns [Right] with sorted list of active [NotificationBannerEntity] on success,
  /// or [Left] with [Failure] on error.
  Future<Either<Failure, List<NotificationBannerEntity>>> call() async {
    final result = await repository.getActiveBanners();

    return result.fold(
      (failure) => Left(failure),
      (banners) {
        // Filter out expired banners
        final activeBanners =
            banners.where((banner) => !banner.isExpired).toList();

        // Sort by priority: high → medium → low
        activeBanners.sort((a, b) {
          final priorityOrder = {'high': 0, 'medium': 1, 'low': 2};
          return (priorityOrder[a.priority.toString().split('.').last] ?? 99)
              .compareTo(
                  priorityOrder[b.priority.toString().split('.').last] ?? 99);
        });

        return Right(activeBanners);
      },
    );
  }
}
