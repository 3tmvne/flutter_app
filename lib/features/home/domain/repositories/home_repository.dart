import 'package:dartz/dartz.dart';
import 'package:fffff/core/errors/failure.dart';
import 'package:fffff/features/home/domain/entities/home_stats_entity.dart';
import 'package:fffff/features/home/domain/entities/notification_banner_entity.dart';

/// Abstract repository for home feature
/// 
/// Defines the contract for retrieving home dashboard data.
abstract class HomeRepository {
  /// Fetches home statistics
  /// 
  /// Returns [Right] with [HomeStatsEntity] on success,
  /// or [Left] with [Failure] on error.
  Future<Either<Failure, HomeStatsEntity>> getHomeStats();

  /// Fetches active notification banners
  /// 
  /// Returns [Right] with list of [NotificationBannerEntity] on success,
  /// or [Left] with [Failure] on error.
  Future<Either<Failure, List<NotificationBannerEntity>>> getActiveBanners();
}
