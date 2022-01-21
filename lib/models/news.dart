
import 'package:exercise_example/models/user.dart';

class News {
  String image;
  String description;
  User ownerUser;

  News(this.image, this.description, this.ownerUser);
}