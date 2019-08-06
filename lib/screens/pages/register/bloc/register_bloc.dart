import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kelide_jazzb/screens/pages/register/repository/register_repository.dart';
import './bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepository repository;

  RegisterBloc({@required this.repository});
  @override
  RegisterState get initialState => InitialRegisterState();

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if(event is ClickOnRegisterButton){
      yield ShowMobileVerificationForm();
    }
  }
}
