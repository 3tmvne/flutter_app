import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Session interceptor that adds Authorization header with session UUID
class SessionInterceptor extends Interceptor {
  final SharedPreferences _prefs;

  SessionInterceptor(this._prefs);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final sessionId = _prefs.getString('session_id');
    if (sessionId != null) {
      options.headers['Authorization'] = 'Bearer $sessionId';
    }
    super.onRequest(options, handler);
  }
}

/// Locale interceptor that adds Accept-Language header
class LocaleInterceptor extends Interceptor {
  final SharedPreferences _prefs;

  LocaleInterceptor(this._prefs);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final locale = _prefs.getString('chosen_locale') ?? 'fr';
    options.headers['Accept-Language'] = locale == 'ar' ? 'ar-MA' : 'fr-FR';
    super.onRequest(options, handler);
  }
}

/// Provider for the Dio instance with interceptors
final dioProvider = Provider<Dio>((ref) {
  throw UnimplementedError('dioProvider must be initialized with SharedPreferences');
});

/// Function to initialize and configure the Dio instance
Dio initializeDio(SharedPreferences prefs) {
  final baseUrl = const String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://10.0.2.2/api/v1',
  );

  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      contentType: 'application/json',
      responseType: ResponseType.json,
    ),
  );

  // Add interceptors
  dio.interceptors.add(SessionInterceptor(prefs));
  dio.interceptors.add(LocaleInterceptor(prefs));

  return dio;
}
