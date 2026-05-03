import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fffff/core/constants/app_colors.dart';
import 'package:fffff/core/di/providers.dart';
import 'package:fffff/core/providers/locale_provider.dart';
import 'package:fffff/core/router/app_router.dart';
import 'package:fffff/features/home/domain/usecases/get_home_stats_usecase.dart';
import 'package:fffff/features/home/domain/usecases/get_notification_banners_usecase.dart';
import 'package:fffff/features/home/presentation/notifier/home_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPreferences
  final prefs = await SharedPreferences.getInstance();

  // Create provider container with overrides
  final container = ProviderContainer(
    overrides: [
      // Initialize locale provider with the actual notifier
      localeProvider.overrideWith(
        (ref) => LocaleNotifier(prefs),
      ),
    ],
  );

  // Initialize all dependencies
  await initializeDependencies(container, prefs);

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'ScreenAware',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('fr'),
        Locale('ar'),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryGreen,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Segoe UI',
        scaffoldBackgroundColor: AppColors.lightBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColors.primaryGreen),
        ),
      ),
      routerConfig: router,
    );
  }
}
