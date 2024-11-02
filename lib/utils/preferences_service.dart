import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const String _isDarkModeKey = 'isDarkMode';
  static const String _languageKey = 'language';

///
/// THEME PREFERENCE
///
  // Save the theme preference
  Future<void> saveThemePreference(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isDarkModeKey, isDarkMode);
  }

  // Get the theme preference
  Future<bool> getThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isDarkModeKey) ?? false;
  }


 ///
/// LANGUAGE PREFERENCE 
/// 

  // Save the language preference
  Future<void> saveLanguagePreference(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageCode);
  }

  // Get the language preference
  Future<String?> getLanguagePreference() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageKey);
  }
}
