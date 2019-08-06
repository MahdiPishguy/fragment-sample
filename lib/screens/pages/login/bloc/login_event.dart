import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent {}

class ClickOnRegisterButton extends LoginEvent {}

class CheckUserRegistered extends LoginEvent {}
