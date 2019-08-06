import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelide_jazzb/backend/components/expandable_bottom_bar/expandable-bottom-bar.dart';
import 'package:kelide_jazzb/backend/localization/fa.dart';
import 'package:kelide_jazzb/screens/pages/home/view/home.dart';
import 'package:kelide_jazzb/screens/pages/register/view/resigter_user.dart';
import 'package:kelide_jazzb/screens/widgets/application_toolbar.dart';

import '../bloc/bloc.dart';
import '../repository/login_repository.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  LoginRepository _loginRepository = LoginRepository();
  LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();

    _loginBloc = LoginBloc(loginRepository: _loginRepository);
    _loginBloc.dispatch(CheckUserRegistered());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener(
        bloc: _loginBloc,
        listener: (context, state) {},
        child: BlocBuilder<LoginBloc, LoginState>(
          bloc: _loginBloc,
          builder: (context, state) {
            if (state is UserNotRegistered)
              return ResisterUser();
            else
              return Home();
          },
        ),
      )
    );
  }
}
