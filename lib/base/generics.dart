
import 'package:exercise_example/models/user.dart';

class GenericsResponse<T> {
  getData(Map<dynamic, dynamic> data) {
    if(T == User) {
      return User.fromJson(data) as T;
    }

    return null;
  }
}