
import 'package:exercise_example/base/screen_base.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePage();
  }
}

class _ProfilePage extends BaseState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text('Profile'))
    );
  }
  
}