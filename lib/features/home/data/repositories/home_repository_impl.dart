import 'package:dartz/dartz.dart';
import 'package:fffff/core/errors/failure.dart';
import 'package:fffff/core/utils/logger.dart';
import 'package:fffff/features/home/data/datasources/home_local_datasource.dart';
import 'package:fffff/features/home/data/datasources/home_remote_datasource.dart';
import 'package:fffff/features/home/data/models/model_extensions.dart';
import 'package:fffff/features/home/domain/entities/home_stats_entity.dart';
import 'package:fffff/features/home/domain/entities/notification_banner_entity.dart';
import 'package:fffff/features/home/domain/repositories/home_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Concrete implementation of HomeRepository
/// 
/// Implements a caching strategy where remote data is fetched first,
/// cached locally, and used as fallback on network errors.
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDatasource _remote;
  final HomeLocalDatasource _local;
  final SharedPreferences _prefs;

  /// Creates an instance of HomeRepositoryImpl
  const HomeRepositoryImpl({
    required HomeRemoteDatasource remote,
    required HomeLocalDatasource local,
    required SharedPreferences prefs,
  })  : _remote = remote,
        _local = local,
        _prefs = prefs;

  @override
  Future<Either<Failure, HomeStatsEntity>> getHomeStats() async {
    try {
      // Get session ID from preferences
      final sessionId = _prefs.getString('session_id');
      if (sessionId == null) {
        logger.w('No session ID found');
        return Left(NetworkFailure(message: 'Session not found'));
      }

      // Try to fetch from remote
      try {
        final remoteStats = await _remote.getStats('Bearer $sessionId');
        
        // Cache the result
        await _local.cacheHomeStats(remoteStats);
        logger.i('Successfully fetched and cached home stats');
        return Right(remoteStats.toEntity());
      } on Exception catch (e) {
        logger.w('Remote fetch failed, trying cache: $e');
        
        // Try to get from cache on network error
        final cachedStats = await _local.getCachedHomeStats();
        if (cachedStats != null) {
          logger.i('Retrieved home stats from cache');
          return Right(cachedStats.toEntity());
        }
        
        // No cache available
        return Left(NetworkFailure(message: 'Failed to fetch stats'));
      }
    } catch (e) {
      logger.e('Error in getHomeStats: $e');
      return Left(ExceptionFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, List<NotificationBannerEntity>>>
      getActiveBanners() async {
    try {
      // Get session ID and locale from preferences
      final sessionId = _prefs.getString('session_id');
      final locale = _prefs.getString('chosen_locale') ?? 'fr';

      if (sessionId == null) {
        logger.w('No session ID found');
        return Left(NetworkFailure(message: 'Session not found'));
      }

      // Try to fetch from remote
      try {
        final remoteBanners = await _remote.getBanners('Bearer $sessionId', locale);
        
        // Cache the result
        await _local.cacheBanners(remoteBanners);
        logger.i('Successfully fetched and cached banners');
        
        // Filter and return only active banners
        final activeBanners = remoteBanners
            .where((b) => !b.isExpired)
            .map((m) => m.toEntity())
            .toList();
        return Right(activeBanners);
      } on Exception catch (e) {
        logger.w('Remote fetch failed, trying cache: $e');
        
        // Try to get from cache on network error
        final cachedBanners = await _local.getCachedBanners();
        
        // Filter expired banners
        final activeBanners = cachedBanners
            .where((b) => !b.isExpired)
            .map((m) => m.toEntity())
            .toList();
        
        if (activeBanners.isNotEmpty) {
          logger.i('Retrieved banners from cache');
          return Right(activeBanners);
        }
        
        // Return empty list if no cache available
        logger.i('No cached banners available');
        return const Right([]);
      }
    } catch (e) {
      logger.e('Error in getActiveBanners: $e');
      return Left(ExceptionFailure(message: 'Unexpected error: $e'));
    }
  }
}
