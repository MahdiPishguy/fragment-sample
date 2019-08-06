import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RegisterEvent {}

class ClickOnRegisterButton extends RegisterEvent{
  final String mobileNumber;

  ClickOnRegisterButton({@required this.mobileNumber});
}