
import 'package:exercise_example/base/screen_base.dart';
import 'package:exercise_example/resource/strings.dart';
import 'package:exercise_example/scenes/favorite.dart';
import 'package:exercise_example/scenes/home_page.dart';
import 'package:exercise_example/scenes/new_feed_page.dart';
import 'package:exercise_example/scenes/notification_page.dart';
import 'package:exercise_example/scenes/profile_page.dart';

import 'package:flutter/material.dart';

class NewMainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewMainScreen();
  }
}

class _NewMainScreen extends BaseState<NewMainScreen> {
  var _currentIndex = 0;
  final _homePage = HomePage();
  final _feedPage = NewFeedPage();
  final _favoritePage = FavoritePage();
  final _noticePage = NotificationPage();
  final _profilePage = ProfilePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getCurrentPage(),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.pinkAccent,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: Strings.tab_home
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback),
            label: Strings.tab_feed,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: Strings.tab_favorite
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: Strings.tab_notification
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded),
              label: Strings.tab_profile
          )
        ],
        onTap: (value) => setState(() {
          _currentIndex = value;
        }),
      ),
    );
  }

  _getCurrentPage() {
    switch(_currentIndex) {
      case 0:
        return _homePage;
      case 1:
        return _feedPage;
      case 2:
        return _favoritePage;
      case 3:
        return _noticePage;
      case 4:
        return _profilePage;
    }
  }
}