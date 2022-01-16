import 'dart:convert';

import 'package:exercise_example/base/base_response.dart';
import 'package:exercise_example/base/screen_base.dart';
import 'package:exercise_example/blocs/login_bloc.dart';
import 'package:exercise_example/models/user.dart';
import 'package:exercise_example/network/network_module.dart';
import 'package:exercise_example/scenes/registration.dart';
import 'package:exercise_example/widgets/material_textfield.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen() : super();

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends BaseState<LoginScreen> {
  final loginBloc = LoginBloc();
  final _usernameEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();

  Future<BaseResponse<User>> _doOnLogin() async {
    final result = await NetworkModule().post<User>(NetworkModule.LOGIN, json.encode({
      'userName': _usernameEditingController.text,
      'password': _passwordEditingController.text
    }));

    if(result.isSuccess) {
      pushScreen(HomeScreen(result.data));
    } else {
      print(result.message);
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Login Screen'), actions: [IconButton(onPressed: () {
      //   pushScreen(RegisterScreen());
      // }, icon: Icon(Icons.app_registration))]),
      body: Stack(
        children: [
          Image.network(
              'https://i.pinimg.com/736x/fb/b7/1d/fbb71d48275c528dac30741f0e665f56.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.fill),
          Center(
            child: Card(
              margin: const EdgeInsets.all(16),
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: const Text('Login social', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                      child: StreamBuilder(
                        stream: loginBloc.userStream,
                        builder: (context, snapshot) => TextFormField(
                          controller: _usernameEditingController,
                          decoration: InputDecoration(
                              errorText: snapshot.hasError ? snapshot.error.toString() : null,
                              border: UnderlineInputBorder(),
                              labelText: 'Enter your username'
                          ),
                      ))
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                      child: StreamBuilder(
                        stream: loginBloc.passwordStream,
                        builder: (context, snapshot) => TextFormField(
                          controller: _passwordEditingController,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                              errorText: snapshot.hasError ? snapshot.error.toString() : null,
                              border: UnderlineInputBorder(),
                              labelText: 'Enter your password'
                          ),
                      ))
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                      child: OutlinedButton(onPressed: () {
                        if(loginBloc.isValidInfo(_usernameEditingController.text, _passwordEditingController.text)) {
                          _doOnLogin();
                        }
                      }, child: Text('Submit')),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}