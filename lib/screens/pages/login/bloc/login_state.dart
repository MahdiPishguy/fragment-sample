import 'package:meta/meta.dart';

@immutable
abstract class LoginState {}

class InitialLoginState extends LoginState {}

class LoginSuccessful extends LoginState {}

class LoginFail extends LoginState {}

class UserNotRegistered extends LoginState {}
