
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
}