// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get homeWelcomeMessage => 'Votre santé vous appartient';

  @override
  String get homeGreetingMorning => 'Bonjour';

  @override
  String get homeGreetingAfternoon => 'Bon après-midi';

  @override
  String get homeGreetingEvening => 'Bonsoir';

  @override
  String get featureAssessmentTitle => 'Évaluation du risque';

  @override
  String get featureAssessmentSubtitle => 'Test rapide et confidentiel';

  @override
  String get featureCentersTitle => 'Centres de dépistage';

  @override
  String get featureCentersSubtitle => 'Trouver un centre près de vous';

  @override
  String get featureChatbotTitle => 'Assistant santé';

  @override
  String get featureChatbotSubtitle => 'Posez vos questions en privé';

  @override
  String get featureContentTitle => 'Guides & ressources';

  @override
  String get featureContentSubtitle => 'Informations sur la santé';

  @override
  String get statsAssessments => 'évaluations';

  @override
  String get statsNearestCenter => 'plus proche';

  @override
  String get navHome => 'Accueil';

  @override
  String get navMap => 'Carte';

  @override
  String get navChat => 'Chat';

  @override
  String get navProfile => 'Profil';

  @override
  String get selectLanguage => 'Choisir une langue';
}
