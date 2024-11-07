import 'package:flutter/material.dart';
import 'package:rolanda_modified_version/utils/preferences_service.dart';

class LanguageProvider extends ChangeNotifier {
  final PreferencesService _preferencesService = PreferencesService();
  bool isSwahili = false;

  LanguageProvider() {
    _loadLanguagePreference();
  }

  Locale get currentLocale => 
      isSwahili ? const Locale("sw") : const Locale("en");

  void changeLanguage(Locale locale) {
    isSwahili = locale.languageCode == 'sw';
    _preferencesService.saveLanguagePreference(locale.languageCode);
    notifyListeners();
  }

  Future<void> _loadLanguagePreference() async {
    String? language = await _preferencesService.getLanguagePreference();
    isSwahili = language == 'sw';
      notifyListeners();
  }
}
