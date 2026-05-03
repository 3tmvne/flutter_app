import 'package:dio/dio.dart';
import 'package:fffff/features/home/data/models/home_stats_model.dart';
import 'package:fffff/features/home/data/models/notification_banner_model.dart';

/// Abstract interface for home remote data source
abstract class HomeRemoteDatasource {
  /// Fetches home statistics from the API
  Future<HomeStatsModel> getStats(String token);

  /// Fetches notification banners from the API
  Future<List<NotificationBannerModel>> getBanners(
    String token,
    String locale,
  );
}

/// Dio implementation of HomeRemoteDatasource
class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final Dio dio;

  /// Creates an instance of HomeRemoteDatasourceImpl
  HomeRemoteDatasourceImpl(this.dio);

  @override
  Future<HomeStatsModel> getStats(String token) async {
    try {
      final response = await dio.get(
        '/home/stats',
        options: Options(headers: {'Authorization': token}),
      );
      
      if (response.statusCode != 200) {
        throw Exception('Failed to get home stats: ${response.statusCode}');
      }
      
      return HomeStatsModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }

  @override
  Future<List<NotificationBannerModel>> getBanners(
    String token,
    String locale,
  ) async {
    try {
      final response = await dio.get(
        '/notifications/banners',
        queryParameters: {'locale': locale},
        options: Options(headers: {'Authorization': token}),
      );
      
      if (response.statusCode != 200) {
        throw Exception('Failed to get banners: ${response.statusCode}');
      }
      
      final List<dynamic> data = response.data is List ? response.data : [];
      return data
          .map((item) => NotificationBannerModel.fromJson(
              item as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }
}
