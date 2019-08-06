import 'package:flutter/material.dart';
import 'package:kelide_jazzb/screens/fragment_bloc/fragment.dart';
import 'package:kelide_jazzb/screens/fragment_routes.dart';


class ScreenPosts extends StatefulWidget implements Fragment {
  @override
  State<ScreenPosts> createState() => _ScreenPosts();

  @override
  String getRouteName() {
    return PageScreenPosts;
  }

  @override
  String getTitle() {
    return null;
  }
}

class _ScreenPosts extends State<ScreenPosts> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Text('bbbbbb'),
    );
  }
}
