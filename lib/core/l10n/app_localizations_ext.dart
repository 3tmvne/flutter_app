import 'package:flutter/material.dart';
import 'package:fffff/core/l10n/app_localizations_mock.dart';

/// Extension to easily access localization in widgets
extension AppLocalizationsExt on BuildContext {
  /// Get the current locale code (e.g., 'fr', 'ar', 'en')
  String get localeCode => Localizations.localeOf(this).languageCode;

  /// Get the localization strings for the current locale
  AppLocalizationsMock get l10n {
    final locale = Localizations.localeOf(this);
    return AppLocalizationsMock(locale.languageCode);
  }
}
