// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get homeWelcomeMessage => 'صحتك ملكك';

  @override
  String get homeGreetingMorning => 'صباح الخير';

  @override
  String get homeGreetingAfternoon => 'مساء الخير';

  @override
  String get homeGreetingEvening => 'مساء الخير';

  @override
  String get featureAssessmentTitle => 'تقييم المخاطر';

  @override
  String get featureAssessmentSubtitle => 'اختبار سريع وسري';

  @override
  String get featureCentersTitle => 'مراكز الفحص';

  @override
  String get featureCentersSubtitle => 'ابحث عن مركز قريب منك';

  @override
  String get featureChatbotTitle => 'المساعد الصحي';

  @override
  String get featureChatbotSubtitle => 'اطرح أسئلتك بخصوصية';

  @override
  String get featureContentTitle => 'الأدلة والموارد';

  @override
  String get featureContentSubtitle => 'معلومات صحية';

  @override
  String get statsAssessments => 'تقييمات';

  @override
  String get statsNearestCenter => 'الأقرب';

  @override
  String get navHome => 'الرئيسية';

  @override
  String get navMap => 'الخريطة';

  @override
  String get navChat => 'الدردشة';

  @override
  String get navProfile => 'الملف الشخصي';

  @override
  String get selectLanguage => 'اختر اللغة';
}
