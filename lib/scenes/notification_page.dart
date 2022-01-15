
import 'package:exercise_example/base/screen_base.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotificationPage();
  }
}

class _NotificationPage extends BaseState<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text('Notification'))
    );
  }

}