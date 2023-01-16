import 'package:pips_flutter/domain/model/model.dart';
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
const String prefsCurrentLoggedInUser = "PREFS_CURRENT_LOGGED_IN_USER";

abstract class SharedPrefsDataSource {
  //
  Future<String> getAppLanguage();

  Future<void> setOnBoardingScreenViewed();

  // get isOnBoardingScreenViewed
  Future<bool> isOnBoardingScreenViewed();

  Future<void> setIsUserLoggedIn();

  Future<bool> getIsUserLoggedIn();

  Future<void> setUserToken(String token);

  Future<String> getUserToken();

  Future<void> setUser(User user);

  Future<User?> getUser();

  Future<void> clearUser();

  // remove token and remove user log in
  Future<void> logout();

  // store user credentials
  Future<void> storeCredentials(String username, String password);

  // remove user credentials
  Future<void> removeCredentials();
}

class SharedPrefsDataSourceImplementer implements SharedPrefsDataSource {
  final SharedPreferences _sharedPreferences;

  SharedPrefsDataSourceImplementer(this._sharedPreferences);

  @override
  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(prefsKeyLang);

    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.english.getValue();
    }
  }

  // record if user has already viewed onboarding screen locally
  @override
  Future<void> setOnBoardingScreenViewed() async {
    _sharedPreferences.setBool(prefsKeyOnboardingScreen, true);
  }

  // get isOnBoardingScreenViewed
  @override
  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPreferences.getBool(prefsKeyOnboardingScreen) ?? false;
  }

  @override
  Future<void> setIsUserLoggedIn() async {
    _sharedPreferences.setBool(prefsKeyIsUserLoggedIn, true);
  }

  @override
  Future<bool> getIsUserLoggedIn() async {
    return _sharedPreferences.getBool(prefsKeyIsUserLoggedIn) ?? false;
  }

  @override
  Future<void> setUserToken(String token) async {
    _sharedPreferences.setString(prefsKeyBearerToken, token);
  }

  @override
  Future<String> getUserToken() async {
    return _sharedPreferences.getString(prefsKeyBearerToken) ?? "";
  }

  @override
  Future<void> setUser(User user) async {
    print(user);
    _sharedPreferences.setString(prefsCurrentLoggedInUser, userToJson(user));
  }

  @override
  Future<User?> getUser() async {
    return _sharedPreferences.getString(prefsCurrentLoggedInUser) as User?;
  }

  @override
  Future<void> clearUser() async {
    await _sharedPreferences.remove(prefsCurrentLoggedInUser);
  }

  // remove token and remove user log in
  @override
  Future<void> logout() async {
    _sharedPreferences.remove(prefsKeyBearerToken);
    _sharedPreferences.remove(prefsKeyIsUserLoggedIn);
  }

  // store user credentials
  @override
  Future<void> storeCredentials(String username, String password) async {
    _sharedPreferences.setString(prefsKeyUserCredentialsUsername, username);
    _sharedPreferences.setString(prefsKeyUserCredentialsPassword, password);
    _sharedPreferences.setBool(prefsKeyUserCredentialsStored, true);
  }

  // remove user credentials
  @override
  Future<void> removeCredentials() async {
    _sharedPreferences.remove(prefsKeyUserCredentialsUsername);
    _sharedPreferences.remove(prefsKeyUserCredentialsPassword);
    _sharedPreferences.remove(prefsKeyUserCredentialsStored);
  }
}
