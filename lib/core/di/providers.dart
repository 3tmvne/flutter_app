import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:fffff/core/network/dio_client.dart';
import 'package:fffff/core/providers/locale_provider.dart';
import 'package:fffff/features/home/data/datasources/home_local_datasource.dart';
import 'package:fffff/features/home/data/datasources/home_remote_datasource.dart';
import 'package:fffff/features/home/data/repositories/home_repository_impl.dart';
import 'package:fffff/features/home/domain/repositories/home_repository.dart';
import 'package:fffff/features/home/domain/usecases/get_home_stats_usecase.dart';
import 'package:fffff/features/home/domain/usecases/get_notification_banners_usecase.dart';
import 'package:fffff/features/home/presentation/notifier/home_notifier.dart';

/// Provider for SharedPreferences instance
final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) async {
  return SharedPreferences.getInstance();
});

/// Provider for Dio instance with interceptors
final dioProvider = FutureProvider<Dio>((ref) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  return initializeDio(prefs);
});

/// Provider for locale notifier - must be initialized after SharedPreferences
final localeNotifierProvider =
    FutureProvider<LocaleNotifier>((ref) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  return LocaleNotifier(prefs);
});

/// Provider for home remote datasource
final homeRemoteDatasourceProvider =
    FutureProvider<HomeRemoteDatasource>((ref) async {
  final dio = await ref.watch(dioProvider.future);
  return HomeRemoteDatasourceImpl(dio);
});

/// Provider for home local datasource
final homeLocalDatasourceProvider =
    FutureProvider<HomeLocalDatasource>((ref) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  return HomeLocalDatasourceImpl(prefs);
});

/// Provider for HomeRepository implementation
final homeRepositoryProvider = FutureProvider<HomeRepository>((ref) async {
  final remote = await ref.watch(homeRemoteDatasourceProvider.future);
  final local = await ref.watch(homeLocalDatasourceProvider.future);
  final prefs = await ref.watch(sharedPreferencesProvider.future);

  return HomeRepositoryImpl(
    remote: remote,
    local: local,
    prefs: prefs,
  );
});

/// Override provider for GetHomeStatsUsecase
final getHomeStatsUsecaseProvider =
    FutureProvider<GetHomeStatsUsecase>((ref) async {
  final repository = await ref.watch(homeRepositoryProvider.future);
  return GetHomeStatsUsecase(repository: repository);
});

/// Override provider for GetNotificationBannersUsecase
final getNotificationBannersUsecaseProvider =
    FutureProvider<GetNotificationBannersUsecase>((ref) async {
  final repository = await ref.watch(homeRepositoryProvider.future);
  return GetNotificationBannersUsecase(repository: repository);
});

/// Initializes all dependencies for the application
Future<void> initializeDependencies(
  ProviderContainer container,
  SharedPreferences prefs,
) async {
  // Initialize session ID if not exists
  if (prefs.getString('session_id') == null) {
    prefs.setString('session_id', const Uuid().v4());
  }

  // Trigger initialization of other providers
  await container.read(dioProvider.future);
  await container.read(homeRepositoryProvider.future);
  await container.read(getHomeStatsUsecaseProvider.future);
  await container.read(getNotificationBannersUsecaseProvider.future);
}
