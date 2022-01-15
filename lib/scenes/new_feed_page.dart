
import 'package:exercise_example/base/screen_base.dart';
import 'package:flutter/material.dart';

class NewFeedPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewFeedPage();
  }
}

class _NewFeedPage extends BaseState<NewFeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text('New Feed'))
    );
  }

}