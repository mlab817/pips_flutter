import 'package:pips_flutter/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefsKeyLang = "PREFS_KEY_LANG";
const String prefsKeyOnboardingScreen = "PREFS_KEY_ONBOARDING_SCREEN";
// isUserLoggedIn is stored in app preferences
const String prefsKeyIsUserLoggedIn = "PREFS_KEY_IS_USER_LOGGED_IN";
const String prefsKeyBearerToken = "PREFS_KEY_BEARER_TOKEN";
const String prefsKeyUserCredentialsStored = "PREFS_KEY_USER_CREDENTIALS";
const String prefsKeyUserCredentialsUsername =
    "PREFS_KEY_USER_CREDENTIALS_USERNAME";
const String prefsKeyUserCredentialsPassword =
    "PREFS_KEY_USER_CREDENTIALS_PASSWORD";

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
  }

  Future<void> setUserToken(String token) async {
    _sharedPreferences.setString(prefsKeyBearerToken, token);
  }

  Future<String> getUserToken() async {
    return _sharedPreferences.getString(prefsKeyBearerToken) ?? "";
  }

  // remove token and remove user log in
  Future<void> logout() async {
    _sharedPreferences.remove(prefsKeyBearerToken);
    _sharedPreferences.remove(prefsKeyIsUserLoggedIn);
  }

  // store user credentials
  Future<void> storeCredentials(String username, String password) async {
    _sharedPreferences.setString(prefsKeyUserCredentialsUsername, username);
    _sharedPreferences.setString(prefsKeyUserCredentialsPassword, password);
    _sharedPreferences.setBool(prefsKeyUserCredentialsStored, true);
  }

  // remove user credentials
  Future<void> removeCredentials() async {
    _sharedPreferences.remove(prefsKeyUserCredentialsUsername);
    _sharedPreferences.remove(prefsKeyUserCredentialsPassword);
    _sharedPreferences.remove(prefsKeyUserCredentialsStored);
  }
}
