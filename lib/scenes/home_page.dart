
import 'package:exercise_example/base/screen_base.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends BaseState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Home'))
    );
  }
}