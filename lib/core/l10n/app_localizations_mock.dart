/// Mock AppLocalizations for development/testing
/// 
/// This file provides placeholder localization strings until the
/// actual AppLocalizations from gen_l10n is available.
class AppLocalizationsMock {
  final String locale;

  AppLocalizationsMock(this.locale);

  // Home page strings
  String get homeWelcomeMessage => _t('welcome', 'Bienvenue', 'مرحبا');
  String get homeGreetingMorning => _t('morning', 'Bonjour', 'صباح الخير');
  String get homeGreetingAfternoon => _t('afternoon', 'Bon après-midi', 'مساء الخير');
  String get homeGreetingEvening => _t('evening', 'Bonsoir', 'تصبح على خير');

  // Feature titles
  String get featureAssessmentTitle => _t('assessment_title', 'Auto-Évaluation', 'التقييم الذاتي');
  String get featureAssessmentSubtitle => _t('assessment_subtitle', 'Vérifiez votre santé', 'تحقق من صحتك');
  String get featureCentersTitle => _t('centers_title', 'Centres', 'المراكز');
  String get featureCentersSubtitle => _t('centers_subtitle', 'Trouvez le plus proche', 'ابحث عن الأقرب');
  String get featureChatbotTitle => _t('chatbot_title', 'Chatbot', 'روبوت الحوار');
  String get featureChatbotSubtitle => _t('chatbot_subtitle', 'Obtenez de l\'aide', 'احصل على المساعدة');
  String get featureContentTitle => _t('content_title', 'Contenu', 'المحتوى');
  String get featureContentSubtitle => _t('content_subtitle', 'Lire des articles', 'اقرأ المقالات');

  // Stats
  String get statsAssessments => _t('stats_assessments', 'Évaluations', 'التقييمات');
  String get statsNearestCenter => _t('stats_center', 'Centre', 'المركز');
  String get statsKm => _t('stats_km', 'km', 'كم');

  // Navigation
  String get navHome => _t('nav_home', 'Accueil', 'الرئيسية');
  String get navMap => _t('nav_map', 'Carte', 'الخريطة');
  String get navChat => _t('nav_chat', 'Chat', 'الدردشة');
  String get navProfile => _t('nav_profile', 'Profil', 'الملف الشخصي');

  // Language selection
  String get selectLanguage => _t('select_language', 'Choisir la langue', 'اختر اللغة');
  String get french => _t('french', 'Français', 'الفرنسية');
  String get arabic => _t('arabic', 'العربية', 'العربية');

  /// Translate helper - returns French by default, Arabic if locale is 'ar'
  String _t(String key, String frenchValue, String arabicValue) {
    if (locale == 'ar') {
      return arabicValue;
    }
    return frenchValue;
  }

  /// Static factory to get localization for a locale
  static AppLocalizationsMock of(String locale) {
    return AppLocalizationsMock(locale);
  }
}
