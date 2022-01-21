
import 'package:exercise_example/models/user.dart';

class AppNotification {
  User fromUser;
  String title;
  String description;
  String createdAt;
  bool isRead;

  AppNotification(
      this.fromUser, this.title, this.description, this.createdAt, this.isRead);
}