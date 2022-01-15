
import 'package:dio/dio.dart';
import 'package:exercise_example/base/base_response.dart';
import 'package:exercise_example/database/preferences.dart';

const baseUrl = 'http://192.168.100.74:8080/api/v1/';
final getLink = (link) => "$baseUrl$link";
final authorization = (token) => "Bearer $token";
class NetworkModule {
  bool isSetToken = false;

  NetworkModule() : super();

  NetworkModule.taken() {
    this.isSetToken = true;
  }

  // username: quandq || password: test123
  static const LOGIN = 'users/login';

  Future<BaseResponse<T>> post<T>(String path, dynamic request) async {
    final dio = Dio();
    await _addHeaders(dio);

    final response = await dio.post(getLink(path), data: request);

    return BaseResponse.fromJson(response.data);
  }

  Future<BaseResponse<T>> get<T>(String path) async {
    final dio = Dio();
    await _addHeaders(dio);

    final response = await dio.get(getLink(path));

    return BaseResponse.fromJson(response.data);
  }

  Future _addHeaders(Dio dio) async {
    if(this.isSetToken) {
      String token = await Prefs().getPrefs(PREFS_TAKEN);

      if(token.isNotEmpty) {
        dio.options.headers['content-Type'] = 'application/json';
        dio.options.headers["authorization"] = authorization(token);
      }
    }
  }
}