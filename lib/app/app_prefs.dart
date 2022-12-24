import 'package:pips_flutter/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefsKeyLang = "PREFS_KEY_LANG";
const String prefsKeyOnboardingScreen = "PREFS_KEY_ONBOARDING_SCREEN";
// isUserLoggedIn is stored in app preferences
const String prefsKeyIsUserLoggedIn = "PREFS_KEY_IS_USER_LOGGED_IN";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(prefsKeyLang);

    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.english.getValue();
    }
  }

  // record if user has already viewed onboarding screen locally
  Future<void> setOnBoardingScreenViewed() async {
    _sharedPreferences.setBool(prefsKeyOnboardingScreen, true);
  }

  // get isOnBoardingScreenViewed
  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPreferences.getBool(prefsKeyOnboardingScreen) ?? false;
  }

  Future<void> setIsUserLoggedIn() async {
    _sharedPreferences.setBool(prefsKeyIsUserLoggedIn, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(prefsKeyIsUserLoggedIn) ?? false;
    // return false;
  }
}
