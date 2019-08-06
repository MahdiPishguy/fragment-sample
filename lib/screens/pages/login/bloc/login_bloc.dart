import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../repository/login_repository.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc({@required this.loginRepository});

  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is ClickOnRegisterButton) {
    } else if (event is CheckUserRegistered) {
      yield UserNotRegistered();
    }
  }
}
