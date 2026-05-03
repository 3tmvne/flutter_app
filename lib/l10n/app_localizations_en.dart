// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get homeWelcomeMessage => 'Your health belongs to you';

  @override
  String get homeGreetingMorning => 'Good morning';

  @override
  String get homeGreetingAfternoon => 'Good afternoon';

  @override
  String get homeGreetingEvening => 'Good evening';

  @override
  String get featureAssessmentTitle => 'Risk Assessment';

  @override
  String get featureAssessmentSubtitle => 'Quick and confidential test';

  @override
  String get featureCentersTitle => 'Screening Centers';

  @override
  String get featureCentersSubtitle => 'Find a center near you';

  @override
  String get featureChatbotTitle => 'Health Assistant';

  @override
  String get featureChatbotSubtitle => 'Ask your questions privately';

  @override
  String get featureContentTitle => 'Guides & Resources';

  @override
  String get featureContentSubtitle => 'Health information';

  @override
  String get statsAssessments => 'assessments';

  @override
  String get statsNearestCenter => 'nearest';

  @override
  String get navHome => 'Home';

  @override
  String get navMap => 'Map';

  @override
  String get navChat => 'Chat';

  @override
  String get navProfile => 'Profile';

  @override
  String get selectLanguage => 'Select Language';
}
