import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Notifier for managing the current locale
class LocaleNotifier extends StateNotifier<String> {
  final SharedPreferences _prefs;

  LocaleNotifier(this._prefs) : super(_getInitialLocale(_prefs));

  /// Get the initially saved locale or default to 'fr'
  static String _getInitialLocale(SharedPreferences prefs) {
    return prefs.getString('chosen_locale') ?? 'fr';
  }

  /// Set the locale and persist to SharedPreferences
  void setLocale(String locale) {
    _prefs.setString('chosen_locale', locale);
    state = locale;
  }
}

/// Provider for the locale state
final localeProvider = StateNotifierProvider<LocaleNotifier, String>((ref) {
  // This will be overridden during initialization
  throw UnimplementedError('localeProvider must be initialized');
});

/// Provider for initializing locale with SharedPreferences
final initLocalProviderProvider =
    Provider<StateNotifierProvider<LocaleNotifier, String>>((ref) {
  throw UnimplementedError('initLocalProviderProvider must be initialized');
});
