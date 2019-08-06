import 'package:meta/meta.dart';

@immutable
abstract class RegisterState {}

class InitialRegisterState extends RegisterState {}

class RegisterSuccessful extends RegisterState {}

class RegisterFail extends RegisterState {}

class ShowMobileVerificationForm extends RegisterState{}