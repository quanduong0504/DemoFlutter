
import 'dart:convert';

import 'package:exercise_example/base/screen_base.dart';
import 'package:exercise_example/database/preferences.dart';
import 'package:exercise_example/models/user.dart';
import 'package:exercise_example/resource/fonts.dart';
import 'package:exercise_example/resource/images.dart';
import 'package:exercise_example/widgets/payment_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends BaseState<HomePage> {
  Future<User> _getUser() async {
    final strUser = await Prefs().getString(PREFS_USER);
    return User.fromLocalJson(json.decode(strUser));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SingleChildScrollView(
        child: Padding(
          // padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: MediaQuery.of(context).viewPadding.top),
          padding: EdgeInsets.zero,
          child: FutureBuilder<User>(
            future: _getUser(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              if(snapshot.hasData) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 16, right: 16, top: MediaQuery.of(context).viewPadding.top),
                        color: Color.fromRGBO(110, 52, 139, 1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(children: [
                              Expanded(
                                  flex: 1,
                                  child: Text('Hello\nWelcome ${snapshot.data?.userName}', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, fontFamily: Fonts.Merienda, color: Colors.white))),
                              ClipRRect(
                                child: Image(image: AssetImage(ImagesResource.icon_default_avatar), width: 50, height: 50),
                                borderRadius: BorderRadius.circular(12),
                              )
                            ]),
                            Padding(
                                padding: EdgeInsets.only(top: 16),
                                child: PaymentCard()
                            )
                          ],
                        )
                      ),
                      Image(image: AssetImage(ImagesResource.bg_wave), fit: BoxFit.fitHeight)
                    ]
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )
      )
    ));
  }
}