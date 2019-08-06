import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:kelide_jazzb/screens/pages/home/view/home.dart';

class Navigation {
  static Router router;

  static void initRoutes() {
    router = Router()
      ..define('home', handler: Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
        return Home();
      }));
  }
}
