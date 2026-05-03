# ScreenAware — GitHub Copilot Project Instructions

## What this project is
ScreenAware is a public health mobile app for HIV, Hepatitis, and Syphilis 
screening awareness in Morocco. It is built with Flutter (Android + iOS).
The app is bilingual: Arabic (RTL) and French (LTR).

## Non-negotiable privacy rules — enforce in every file
- NEVER collect, store, or transmit personal data (no name, email, phone, 
  location history)
- Assessment answers MUST be scored on-device only. NEVER send raw answers 
  to any API
- Sessions use UUID only. No authentication is required from users
- GPS coordinates are requested only when the user explicitly taps 
  "Find centers near me" — never passively or at app start
- Use SharedPreferences only for: session_id (UUID), chosen locale, 
  notification preferences

## Architecture — Clean Architecture + MVVM strictly enforced
Every feature follows this exact three-layer structure:
  feature/
  ├── data/
  │   ├── datasources/     # API calls (remote) and local cache (local)
  │   ├── models/          # JSON-serializable DTOs (freezed + json_serializable)
  │   └── repositories/    # Concrete implementations of domain contracts
  ├── domain/
  │   ├── entities/        # Pure Dart classes — NO Flutter imports
  │   ├── repositories/    # Abstract interfaces only
  │   └── usecases/        # One public method each, return Either<Failure, T>
  └── presentation/
      ├── notifier/        # Riverpod AsyncNotifier or Notifier classes
      ├── pages/           # Full screens, suffix: Page
      └── widgets/         # Feature-specific widgets, suffix: Widget

## State management: Riverpod (riverpod_annotation, code generation)
- Use @riverpod annotation on all providers
- Use AsyncNotifier for async operations, Notifier for sync
- Use ref.watch() in widgets, ref.read() in handlers only
- Never use setState() or ChangeNotifier

## HTTP client: Dio + Retrofit
- All API calls go through the Dio client in core/network/dio_client.dart
- Session ID attached via SessionInterceptor (Authorization: Bearer <uuid>)
- Locale attached via LocaleInterceptor (Accept-Language header)
- All API responses deserialised through Freezed models

## Navigation: GoRouter
- All routes defined in core/router/app_router.dart
- Use typed routes (GoRouterState extensions)
- Route guards check session existence before allowing navigation past onboarding

## i18n: flutter_localizations + intl
- All user-facing strings in lib/l10n/app_fr.arb and lib/l10n/app_ar.arb
- NEVER hardcode French or Arabic strings in Dart files
- Use context.l10n.yourKey syntax via the AppLocalizations extension
- RTL layout handled automatically by Flutter — do not manually flip widgets; 
  use Directionality-aware widgets (start/end instead of left/right)

## Error handling
- Domain usecases return Either<Failure, T> using dartz package
- UI notifiers map Left(Failure) to an error state displayed to the user
- Network errors show a retry widget, never crash silently

## Code style rules (Copilot must follow)
- Dart: strong mode, no dynamic types, explicit return types always
- File names: snake_case. Class names: PascalCase
- Max line length: 100 characters
- No print() statements — use the logger (core/utils/logger.dart)
- Every public class and method gets a /// dartdoc comment
- Widgets: prefer const constructors everywhere possible
- Keep widget build() methods under 50 lines — extract into sub-widgets

## Flutter packages in use (do not suggest alternatives)
  State:       flutter_riverpod, riverpod_annotation, riverpod_generator
  HTTP:        dio, retrofit, retrofit_generator
  Models:      freezed, freezed_annotation, json_serializable, json_annotation
  Navigation:  go_router
  Storage:     shared_preferences
  Maps:        google_maps_flutter, geolocator
  Chat:        speech_to_text, flutter_tts
  Push:        firebase_core, firebase_messaging
  i18n:        flutter_localizations (SDK), intl
  DI:          get_it, injectable, injectable_generator
  Util:        dartz, uuid, logger
  Dev:         build_runner, dart_code_metrics, mocktail (tests)

## API base URL constant
  Development:  http://10.0.2.2/api/v1   (Android emulator → localhost)
  Staging:      https://staging.screenaware.ma/api/v1
  Production:   https://api.screenaware.ma/api/v1
  
  Controlled via --dart-define=API_BASE_URL=... at build time.

## Test requirements
- Every usecase: unit test with mocktail mocks
- Every notifier: unit test covering loading / success / error states
- Every Page widget: widget test covering initial render and key interactions
- No test should make real network calls — always mock the repository