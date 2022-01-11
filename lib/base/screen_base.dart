
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class WidgetBase<T extends StatefulWidget> extends State<T> {
  static final String PREFS_PRODUCTION = "PREFS_PRODUCTION";
  static final String apiKey = '2d99d6c5f9eaeac7ee8f600164f06e18';

  void pushScreen(StatefulWidget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  void pushScreenAndAwaitResult(StatefulWidget screen, Function result) async {
    final rs = await Navigator.push(context, MaterialPageRoute(builder: (context) => screen));

    result(rs);
  }

  void pushStateLess(StatelessWidget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  void pushNamed(routerName, Object arguments) {
    Navigator.pushNamed(context, routerName, arguments: arguments);
  }

  void getPrefs<R>(String key, Function result) async {
    final prefs = await SharedPreferences.getInstance();

    switch(R.runtimeType) {
      case int:
        result(prefs.getInt(key));
        break;
      case String:
        result(prefs.getString(key));
        break;
      case double:
        result(prefs.getDouble(key));
        break;
      case bool:
        result(prefs.getBool(key));
        break;
      default:
        result(prefs.getStringList(key));
        break;
    }

    prefs.reload();
  }

  void putPrefs(String key, dynamic data, Function? onSavedDone) async {
    final prefs = await SharedPreferences.getInstance();
    bool result = false;

    print(data);

    switch(data.runtimeType) {
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

    print('put prefs is $result');

    if(onSavedDone != null) {
      onSavedDone();
    }
  }

  void showSnackBar(String msg) {
    final snackBar = SnackBar(content: Text(msg));

    ScaffoldMessenger.of(context)
                     ..removeCurrentSnackBar()
                     ..showSnackBar(snackBar);
  }

  getAsync(String path, Map<String, dynamic>? params, Function response) async {
    final rp = await Dio().get(path, queryParameters: params);

    response(rp);
  }
}