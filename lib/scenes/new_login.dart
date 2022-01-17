
import 'dart:convert';

import 'package:exercise_example/base/screen_base.dart';
import 'package:exercise_example/database/preferences.dart';
import 'package:exercise_example/models/user.dart';
import 'package:exercise_example/network/network_module.dart';
import 'package:exercise_example/resource/fonts.dart';
import 'package:exercise_example/resource/images.dart';
import 'package:exercise_example/resource/strings.dart';
import 'package:exercise_example/scenes/new_main.dart';
import 'package:exercise_example/widgets/material_textfield.dart';
import 'package:exercise_example/widgets/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewLoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewLoginScreenState();
  }
}

class _NewLoginScreenState extends BaseState<NewLoginScreen> {
  var _isLoading = false;
  final _userKey = GlobalKey<MaterialTextFormFieldState>();
  final _passwordKey = GlobalKey<MaterialTextFormFieldState>();

  void _doOnLogin() async {
    Prefs().put(PREFS_USER, json.encode(User.fake()));
    pushScreen(NewMainScreen());
    // final result = await NetworkModule().post<User>(NetworkModule.LOGIN, json.encode({
    //   'userName': _userKey.currentState!.getText(),
    //   'password': _passwordKey.currentState!.getText()
    // }));
    //
    // setState(() {
    //   _isLoading = false;
    // });
    //
    // if(result.isSuccess) {
    //   final prefs = Prefs();
    //   prefs.put(PREFS_USER, json.encode(result.data?.toJson()));
    //   prefs.put(PREFS_TAKEN, result.data?.token);
    //   pushScreen(NewMainScreen());
    // } else {
    //   showSnackBar(result.message);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Stack(
              children: [
                ConstrainedBox(
                    constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
                    child: Center(
                        child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Stack(
                                    children: [
                                      AspectRatio(
                                          aspectRatio: 16/9,
                                          child: Image(image: AssetImage(ImagesResource.image_bus))
                                      )
                                    ],
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(top: 30, bottom: 50),
                                      child: const Text(Strings.hello_well_come_back, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, fontFamily: Fonts.Pacifico))
                                  ),
                                  MaterialTextFormField(textHint: Strings.username, textError: Strings.user_is_invalid, key: _userKey, inputStyle: InputStyle.OUTLINE, padding: EdgeInsets.zero),
                                  MaterialTextFormField(textHint: Strings.password, textError: Strings.password_is_invalid, key: _passwordKey, inputStyle: InputStyle.OUTLINE, isPassword: true, padding: EdgeInsets.only(top: 30, bottom: 60)),
                                  RoundedButton(onPressed: () {
                                    final userValidator = _userKey.currentState!.validator();
                                    final passwordValidator = _passwordKey.currentState!.validator();
                                    if(userValidator && passwordValidator) {
                                      setState(() {
                                        _isLoading = true;
                                      });
                                      _doOnLogin();
                                    }
                                  }, style: ShapeStyle.SQUARE, title: Strings.login, height: 55),
                                  Padding(
                                      padding: EdgeInsets.only(top: 40),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: const Text(Strings.new_user_or_sign_up,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black38
                                                ),
                                              )
                                          ),
                                          Expanded(
                                              flex: 1,
                                              child: const Text(Strings.forgot_password,
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.blue
                                                ),
                                              )
                                          )
                                        ],
                                      )
                                  )
                                ]
                            )
                        )
                    )
                ),
                _isLoading ? Positioned.fill(child: Align(alignment: FractionalOffset.center, child: CircularProgressIndicator())) : Container()
              ],
            )
        ),
      )
    );
  }
}