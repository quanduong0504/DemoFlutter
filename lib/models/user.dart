
import 'package:exercise_example/base/base_response.dart';

class User {
  int id;
  String userName;
  int gender;
  String? email;
  String? avatar;
  String phone;
  String fullName;
  String? facebookId;
  String? googleId;
  int permission;
  String token;

  User.create(this.id,
      this.userName,
      this.gender,
      this.email,
      this.avatar,
      this.phone,
      this.fullName,
      this.facebookId,
      this.googleId,
      this.permission,
      this.token);

  factory User.fromJson(Map parsedJson) {
    return User.create(
        parsedJson['user']['id'],
        parsedJson['user']['userName'],
        parsedJson['user']['gender'],
        parsedJson['user']['email'],
        parsedJson['user']['avatar'],
        parsedJson['user']['phone'],
        parsedJson['user']['fullName'],
        parsedJson['user']['facebookId'],
        parsedJson['user']['googleId'],
        parsedJson['user']['permission'],
        parsedJson['token']
    );
  }

  factory User.fromLocalJson(Map parsedJson) {
    return User.create(
        parsedJson['id'],
        parsedJson['userName'],
        parsedJson['gender'],
        parsedJson['email'],
        parsedJson['avatar'],
        parsedJson['phone'],
        parsedJson['fullName'],
        parsedJson['facebookId'],
        parsedJson['googleId'],
        parsedJson['permission'],
        parsedJson['token']
    );
  }

  factory User.fake() {
    return User.create(1, 'Quandq', 1, 'quandq@biplus.com.vn', '', '0919191919', 'Quan Quoc', null, null, 100, 'aaslkdajlksjdlakjzxcnlkn');
  }

  Map toJson() => {
    'id': id,
    'userName': userName,
    'gender': gender,
    'email': email,
    'avatar': avatar,
    'phone': phone,
    'fullName': fullName,
    'facebookId': facebookId,
    'googleId': googleId,
    'permission': permission,
    'token': token
  };
}