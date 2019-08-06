import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelide_jazzb/backend/localization/fa.dart';
import 'package:kelide_jazzb/database/app_database.dart';
import 'package:kelide_jazzb/navigation.dart';
import 'package:kelide_jazzb/screens/fragment_bloc/fragment_bloc.dart';
import 'package:kelide_jazzb/screens/pages/home/view/home.dart';

void main() async {
  AppDatabase().createModel();

  AppDatabase().initializeDB((result) {
    if (result == true) {}

    return null;
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    Navigation.initRoutes();
  }

  @override
  Widget build(BuildContext context) {
    //Lesson xcccc = Lesson();
    //Lesson().select().toList();
    //print(xcccc);

    return MaterialApp(
      title: Fa.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Directionality(textDirection: TextDirection.rtl, child: BlocProvider(builder: (BuildContext context) => FragmentBloc(), child: Home())),
    );
  }
}
