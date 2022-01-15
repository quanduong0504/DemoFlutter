
class Validators {
  static bool isValidUser(String? username) {
    return username != null && username.isNotEmpty && username.length >= 6;
  }
}