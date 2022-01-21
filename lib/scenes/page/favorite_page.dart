
import 'package:exercise_example/base/screen_base.dart';
import 'package:exercise_example/resource/fonts.dart';
import 'package:exercise_example/resource/images.dart';
import 'package:exercise_example/widgets/material_textfield.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FavoritePageState();
  }
}

class _FavoritePageState extends BaseState<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Material(
                    color: Colors.pink,
                    shadowColor: Colors.green,
                    elevation: 10,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top, bottom: 12),
                            child: Text('Favorite', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 26, fontFamily: Fonts.BalsamiqSans))
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Padding(
                                padding: EdgeInsets.all(8),
                                child: TextField(
                                    style: TextStyle(height: 2.0, fontSize: 14),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.search, size: 24),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hintStyle: TextStyle(fontSize: 14, fontFamily: Fonts.BalsamiqSans),
                                      contentPadding: EdgeInsets.all(6),
                                      hintText: 'Search',
                                    )
                                )
                            ),
                          )
                        ]
                      )
                    )
                )
              )
            ]
          )
        )
    );
  }

}