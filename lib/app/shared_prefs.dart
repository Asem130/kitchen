import 'package:kitchen/presentation/resources/language_manger.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String preferencesLanguageKey = "preferencesLanguageKey";

class AppPreferences {
  SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(preferencesLanguageKey);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.english.getValue();
    }
  }
}
