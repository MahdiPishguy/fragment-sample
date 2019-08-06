import 'package:flutter/material.dart';
import 'package:kelide_jazzb/screens/fragment_bloc/fragment.dart';
import 'package:kelide_jazzb/screens/fragment_routes.dart';


class ScreenSections extends StatefulWidget implements Fragment {
  @override
  State<ScreenSections> createState() => _ScreenSections();

  @override
  String getName() {
    return PageScreenSections;
  }

  @override
  String getRouteName() {
    return null;
  }

  @override
  String getTitle() {
    // TODO: implement getTitle
    return null;
  }
}

class _ScreenSections extends State<ScreenSections> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Text('aaaaaaaa'),
    );
  }
}
