
import 'package:exercise_example/base/generics.dart';

class BaseResponse<T> {
  String status;
  int errorCode;
  String message;
  T? data;
  bool isSuccess;

  BaseResponse.init(this.status, this.errorCode, this.message, this.isSuccess, this.data);

  factory BaseResponse.fromJson(Map<dynamic, dynamic> parsedJson) {
    T? resultData;
    if(parsedJson['data'] != null) {
      resultData = GenericsResponse<T>().getData(parsedJson['data']);
    }
    int errorCode = parsedJson['errorCode'];
    final isSuccess = (errorCode == 200) && (resultData != null);

    return BaseResponse.init(
        parsedJson['status'],
        errorCode,
        parsedJson['message'],
        isSuccess,
        resultData
    );
  }
}