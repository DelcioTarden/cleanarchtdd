import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final SharedPreferencesHelper _preferencesHelper = SharedPreferencesHelper._internal();
  SharedPreferencesHelper._internal();
  static SharedPreferencesHelper get instance { return _preferencesHelper; }

  Future<bool> saveData(String nameKey, String value) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.setString(nameKey, value);
    } catch (_) {}
    return false;
  }

  Future<String> loadData(String nameKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String response = prefs.getString(nameKey).toString();
    return response;
  }

  Future<bool> deleteData(String nameKey) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.remove(nameKey);
    } catch (_) {}
    return false;
  }
  
}