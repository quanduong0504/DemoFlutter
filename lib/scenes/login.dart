import 'package:exercise_example/base/screen_base.dart';
import 'package:exercise_example/scenes/home.dart';
import 'package:exercise_example/scenes/registration.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen() : super();

  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends WidgetBase<LoginScreen> {
  final _usernameFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen'), actions: [IconButton(onPressed: () {
        pushScreen(RegisterScreen());
      }, icon: Icon(Icons.app_registration))]),
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
                      child: Form(
                        key: _usernameFormKey,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter your username'
                          ),
                          validator: (value) {
                            if(value == null || value.trim().isEmpty) {
                              return 'Username is required';
                            }

                            return null;
                          },
                        ),
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                      child: Form(
                        key: _passwordFormKey,
                        child: TextFormField(
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter your password'
                          ),
                          validator: (value) {
                            if(value == null || value.trim().isEmpty) {
                              return 'Password is required';
                            }

                            return null;
                          },
                        ),
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                      child: OutlinedButton(onPressed: () {
                        final isPassUser = _usernameFormKey.currentState!.validate();
                        final isPassPassword = _passwordFormKey.currentState!.validate();

                        if (isPassUser && isPassPassword) {
                          pushScreen(HomeScreen());
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