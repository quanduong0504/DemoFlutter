
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_TAKEN = "PREFS_TAKEN";
const String PREFS_USER = "PREFS_USER";
class Prefs {
  Future<String> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  Future<bool> put(String key, dynamic data) async {
    final prefs = await SharedPreferences.getInstance();
    bool result = false;

    switch (data.runtimeType) {
      case String:
        result = await prefs.setString(key, data);
        break;
      case int:
        result = await prefs.setInt(key, data);
        break;
      case double:
        result = await prefs.setDouble(key, data);
        break;
      case bool:
        result = await prefs.setBool(key, data);
        break;
      case List:
        result = await prefs.setStringList(key, data);
        break;
    }

    return result;
  }
}