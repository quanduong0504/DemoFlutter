
import 'dart:async';

import 'package:exercise_example/blocs/base_bloc.dart';
import 'package:exercise_example/validators/Validators.dart';

class LoginBloc extends BaseBloc {
  final _usernameController = StreamController();
  final _passwordController = StreamController();

  Stream get userStream => _usernameController.stream;
  Stream get passwordStream => _passwordController.stream;

  bool isValidInfo(String username, String password) {
    final isInvalidUser = !Validators.isValidUser(username);
    final isInvalidPassword = !Validators.isValidUser(password);

    if(isInvalidUser) {
      _usernameController.sink.addError('Username is invalid');
    } else _usernameController.sink.add(eventDone);

    if(isInvalidPassword) {
      _passwordController.sink.addError('password is invalid');
    } else _passwordController.sink.add(eventDone);

    return !isInvalidUser && !isInvalidPassword;
  }

  @override
  void dispose() {
    _usernameController.close();
    _passwordController.close();
  }}