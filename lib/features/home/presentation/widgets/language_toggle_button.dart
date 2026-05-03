import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fffff/core/constants/app_colors.dart';
import 'package:fffff/core/l10n/app_localizations_ext.dart';
import 'package:fffff/core/providers/locale_provider.dart';

/// Language toggle button for the home header
class LanguageToggleButton extends ConsumerWidget {
  /// Creates a LanguageToggleButton
  const LanguageToggleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(localeProvider);

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      elevation: 1,
      child: InkWell(
        onTap: () => _showLanguageDialog(context, ref),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                currentLocale == 'ar' ? '🇲🇦 AR' : '🇫🇷 FR',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryGreen,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.primaryGreen,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Shows the language selection dialog
  void _showLanguageDialog(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.l10n.selectLanguage,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            _LanguageOption(
              flag: '🇫🇷',
              name: 'Français',
              locale: 'fr',
              onTap: () {
                ref.read(localeProvider.notifier).setLocale('fr');
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 12),
            _LanguageOption(
              flag: '🇲🇦',
              name: 'العربية',
              locale: 'ar',
              onTap: () {
                ref.read(localeProvider.notifier).setLocale('ar');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Individual language option in the dialog
class _LanguageOption extends StatelessWidget {
  final String flag;
  final String name;
  final String locale;
  final VoidCallback onTap;

  const _LanguageOption({
    required this.flag,
    required this.name,
    required this.locale,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.lightBackground,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(flag, style: const TextStyle(fontSize: 24)),
              const SizedBox(width: 12),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
