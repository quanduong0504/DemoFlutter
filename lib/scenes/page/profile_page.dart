
import 'package:exercise_example/base/screen_base.dart';
import 'package:exercise_example/resource/fonts.dart';
import 'package:exercise_example/widgets/profile_view.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends BaseState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                  color: Colors.black87,
                  height: 250,
              ),
              Padding(
                padding: EdgeInsets.only(top: 88, left: 20),
                child: Text('Profile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 24, fontFamily: Fonts.BalsamiqSans))
              ),
              Padding(
                  padding: EdgeInsets.only(top: 125),
                  child: ProfileView()
              )
            ],
          )
        )
    );
  }
  
}