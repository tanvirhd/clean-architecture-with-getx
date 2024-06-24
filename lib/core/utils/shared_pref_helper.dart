
import 'package:shared_preferences/shared_preferences.dart';

//all shared pref related keys
const String BN = "bn";
const String EN = "en";

//helper class
class SharedPreferenceHelper {
  static final SharedPreferenceHelper _instance = SharedPreferenceHelper._internal();

  late SharedPreferences _prefs;

  factory SharedPreferenceHelper() {
    return _instance;
  }

  SharedPreferences getSharedPrefHelperInstance(){
    return _prefs;
  }

  SharedPreferenceHelper._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  int? getInt(String key) {
    return _prefs.getInt(key);
  }

  Future<void> setInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  Future<void> deleteAllData() async {
    _prefs.clear();
  }
}