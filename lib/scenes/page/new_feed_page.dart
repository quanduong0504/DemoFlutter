
import 'package:exercise_example/base/screen_base.dart';
import 'package:flutter/material.dart';

class NewFeedPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewFeedPageState();
  }
}

class _NewFeedPageState extends BaseState<NewFeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        body: Center(child: Text('New Feed'))
    );
  }

}