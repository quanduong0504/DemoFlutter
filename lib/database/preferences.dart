
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_TAKEN = "PREFS_TAKEN";
class Prefs {
  Future<dynamic> getPrefs<R>(String key) async {
    final prefs = await SharedPreferences.getInstance();

    switch(R.runtimeType) {
      case int:
        return prefs.getInt(key);
      case String:
        return prefs.getString(key);
      case double:
        return prefs.getDouble(key);
      case bool:
        return prefs.getBool(key);
      default:
        return prefs.getStringList(key);
    }
  }

  Future<bool> putPrefs(String key, dynamic data) async {
    final prefs = await SharedPreferences.getInstance();
    bool result = false;

    print(data);

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
      default:
        result = await prefs.setStringList(key, data);
        print(data.runtimeType);
        break;
    }

    return result;
  }
}