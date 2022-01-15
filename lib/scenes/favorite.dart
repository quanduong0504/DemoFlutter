
import 'package:exercise_example/base/screen_base.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FavoritePage();
  }
}

class _FavoritePage extends BaseState<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text('Favorite'))
    );
  }

}