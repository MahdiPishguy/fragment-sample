import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelide_jazzb/backend/localization/fa.dart';
import 'package:kelide_jazzb/navigation.dart';
import 'package:kelide_jazzb/screens/pages/register/bloc/bloc.dart';
import 'package:kelide_jazzb/screens/pages/register/repository/register_repository.dart';
import 'package:kelide_jazzb/screens/widgets/application_toolbar.dart';

class ResisterUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ResisterUser();
}

class _ResisterUser extends State<ResisterUser> {
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _smsCodeController = TextEditingController();

  RegisterRepository _registerRepository;
  RegisterBloc _registerBloc;

  @override
  void initState() {
    super.initState();
    _registerBloc = RegisterBloc(repository: _registerRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationToolbar(
        title: Fa.registerInApp,
      ),
      body: Container(
        padding: EdgeInsets.all(25.0),
        child: BlocListener(
          bloc: _registerBloc,
          listener: (context, state) {},
          child: BlocBuilder<RegisterBloc, RegisterState>(
            bloc: _registerBloc,
            builder: (context, state) {
              if (state is InitialRegisterState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        Fa.pleaseEnterYourMobileNumber,
                        style: Theme.of(context).textTheme.caption.copyWith(
                              fontFamily: 'IranSansLight',
                              color: Colors.black,
                            ),
                      ),
                    ),
                    TextFormField(
                        controller: _mobileNumberController,
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.phone,
                        style: Theme.of(context).textTheme.caption.copyWith(
                              fontFamily: 'IranSansLight',
                              color: Colors.black,
                            ),
                        textInputAction: TextInputAction.send,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.grey),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red, width: 0.0),
                          ),
                          contentPadding: EdgeInsets.all(5.0),
                          errorStyle: Theme.of(context).textTheme.overline.copyWith(
                                fontFamily: 'IranSansLight',
                                color: Colors.black,
                              ),
                          prefixIcon: Icon(Icons.account_circle),
                          hintText: Fa.yourMobileNumber,
                          hintStyle: Theme.of(context).textTheme.caption.copyWith(fontFamily: 'IranSansLight'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        )),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Container(
                            constraints: BoxConstraints(
                              minWidth: 150.0,
                            ),
                            child: RaisedButton(
                                color: Colors.blueAccent,
                                child: Text(
                                  Fa.register,
                                  style: Theme.of(context).textTheme.caption.copyWith(fontFamily: 'IranSansLight', color: Colors.white),
                                ),
                                onPressed: ()=>register(),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else if(state is ShowMobileVerificationForm){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        Fa.pleaseEnterSmsCode,
                        style: Theme.of(context).textTheme.caption.copyWith(
                              fontFamily: 'IranSansLight',
                              color: Colors.black,
                            ),
                      ),
                    ),
                    TextFormField(
                        controller: _smsCodeController,
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.phone,
                        style: Theme.of(context).textTheme.caption.copyWith(
                              fontFamily: 'IranSansLight',
                              color: Colors.black,
                            ),
                        textInputAction: TextInputAction.send,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.grey),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red, width: 0.0),
                          ),
                          contentPadding: EdgeInsets.all(5.0),
                          errorStyle: Theme.of(context).textTheme.overline.copyWith(
                                fontFamily: 'IranSansLight',
                                color: Colors.black,
                              ),
                          prefixIcon: Icon(Icons.account_circle),
                          hintText: Fa.yourSmsCode,
                          hintStyle: Theme.of(context).textTheme.caption.copyWith(fontFamily: 'IranSansLight'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        )),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Container(
                            constraints: BoxConstraints(
                              minWidth: 150.0,
                            ),
                            child: RaisedButton(
                                color: Colors.blueAccent,
                                child: Text(
                                  Fa.activeAccount,
                                  style: Theme.of(context).textTheme.caption.copyWith(fontFamily: 'IranSansLight', color: Colors.white),
                                ),
                                onPressed: ()=>Navigation.router.navigateTo(context, 'home',transition: TransitionType.fadeIn),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }else{
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  register() {
    _registerBloc.dispatch(ClickOnRegisterButton(mobileNumber: ''));
  }
}
