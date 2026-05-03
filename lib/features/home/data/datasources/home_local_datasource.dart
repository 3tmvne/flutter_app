import 'package:shared_preferences/shared_preferences.dart';
import 'package:fffff/core/utils/logger.dart';
import 'package:fffff/features/home/data/models/home_stats_model.dart';
import 'package:fffff/features/home/data/models/notification_banner_model.dart';
import 'dart:convert';

/// Abstract interface for home local data source
abstract class HomeLocalDatasource {
  /// Caches home statistics locally
  Future<void> cacheHomeStats(HomeStatsModel stats);

  /// Retrieves cached home statistics
  /// Returns null if no valid cache exists
  Future<HomeStatsModel?> getCachedHomeStats();

  /// Caches notification banners locally
  Future<void> cacheBanners(List<NotificationBannerModel> banners);

  /// Retrieves cached notification banners
  /// Returns empty list if no valid cache exists
  Future<List<NotificationBannerModel>> getCachedBanners();
}

/// SharedPreferences implementation of HomeLocalDatasource
class HomeLocalDatasourceImpl implements HomeLocalDatasource {
  static const String _statsKey = 'home_stats_cache';
  static const String _statsTimestampKey = 'home_stats_cache_timestamp';
  static const String _bannersKey = 'home_banners_cache';
  static const String _bannersTimestampKey = 'home_banners_cache_timestamp';

  // Cache TTL in milliseconds
  static const int _statsMaxAgeMilestone = 5 * 60 * 1000; // 5 minutes
  static const int _bannersMaxAgeMilestone = 15 * 60 * 1000; // 15 minutes

  final SharedPreferences _prefs;

  /// Creates an instance of HomeLocalDatasourceImpl
  HomeLocalDatasourceImpl(this._prefs);

  @override
  Future<void> cacheHomeStats(HomeStatsModel stats) async {
    try {
      final json = jsonEncode(stats.toJson());
      await _prefs.setString(_statsKey, json);
      await _prefs.setInt(_statsTimestampKey, DateTime.now().millisecondsSinceEpoch);
    } catch (e) {
      logger.e('Error caching home stats: $e');
      rethrow;
    }
  }

  @override
  Future<HomeStatsModel?> getCachedHomeStats() async {
    try {
      final json = _prefs.getString(_statsKey);
      final timestamp = _prefs.getInt(_statsTimestampKey);

      if (json == null || timestamp == null) {
        return null;
      }

      // Check if cache is expired
      final age = DateTime.now().millisecondsSinceEpoch - timestamp;
      if (age > _statsMaxAgeMilestone) {
        logger.i('Home stats cache expired');
        return null;
      }

      final decoded = jsonDecode(json) as Map<String, dynamic>;
      return HomeStatsModel.fromJson(decoded);
    } catch (e) {
      logger.e('Error reading cached home stats: $e');
      return null;
    }
  }

  @override
  Future<void> cacheBanners(List<NotificationBannerModel> banners) async {
    try {
      final json = jsonEncode(banners.map((b) => b.toJson()).toList());
      await _prefs.setString(_bannersKey, json);
      await _prefs.setInt(
        _bannersTimestampKey,
        DateTime.now().millisecondsSinceEpoch,
      );
    } catch (e) {
      logger.e('Error caching banners: $e');
      rethrow;
    }
  }

  @override
  Future<List<NotificationBannerModel>> getCachedBanners() async {
    try {
      final json = _prefs.getString(_bannersKey);
      final timestamp = _prefs.getInt(_bannersTimestampKey);

      if (json == null || timestamp == null) {
        return [];
      }

      // Check if cache is expired
      final age = DateTime.now().millisecondsSinceEpoch - timestamp;
      if (age > _bannersMaxAgeMilestone) {
        logger.i('Banners cache expired');
        return [];
      }

      final decoded = jsonDecode(json) as List<dynamic>;
      return decoded
          .map((item) =>
              NotificationBannerModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      logger.e('Error reading cached banners: $e');
      return [];
    }
  }
}
