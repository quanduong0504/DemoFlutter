
import 'package:exercise_example/models/profile_menu_item.dart';
import 'package:exercise_example/resource/images.dart';

class Strings {
  static const String username = 'USERNAME';
  static const String password = 'PASSWORD';
  static const String login = 'Login';
  static const String user_is_invalid = 'USERNAME IS INVALID';
  static const String password_is_invalid = 'PASSWORD IS INVALID';
  static const String hello_well_come_back = 'Hello\nWelcome Back!';
  static const String new_user_or_sign_up = 'NEW USER? SIGN UP';
  static const String forgot_password = 'FORGOT PASSWORD?';
  static const String tab_home = 'Home';
  static const String tab_feed = 'Feed';
  static const String tab_favorite = 'Favorites';
  static const String tab_notification = 'Notification';
  static const String tab_profile = 'Profile';


  static final List<ProfileMenuItem> menuItems = <ProfileMenuItem>[
    ProfileMenuItem(ImagesResource.ic_folder, 'My Profile'),
    ProfileMenuItem(ImagesResource.ic_user, 'Account'),
    ProfileMenuItem(ImagesResource.ic_info, 'Info'),
    ProfileMenuItem(ImagesResource.ic_logout, 'Logout')
  ];
}