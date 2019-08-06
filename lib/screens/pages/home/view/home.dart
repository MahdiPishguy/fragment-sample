import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelide_jazzb/backend/components/expandable_bottom_bar/expandable-bottom-bar.dart';
import 'package:kelide_jazzb/backend/localization/fa.dart';
import 'package:kelide_jazzb/screens/fragment_bloc/bloc.dart';
import 'package:kelide_jazzb/screens/fragment_bloc/fragment.dart';
import 'package:kelide_jazzb/screens/fragment_bloc/fragment_manager.dart';
import 'package:kelide_jazzb/screens/fragment_routes.dart';
import 'package:kelide_jazzb/screens/pages/home/screens/posts/view/screen_posts.dart';
import 'package:kelide_jazzb/screens/pages/home/screens/sections/view/screen_sections.dart';
import 'package:kelide_jazzb/screens/widgets/application_toolbar.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  AnimationController _draggableBottomSheetController;
  Duration _duration = Duration(milliseconds: 500);
  BottomBarController controller;

  @override
  void initState() {
    super.initState();
    controller = BottomBarController(vsync: this, dragLength: 550, snap: true);
    _draggableBottomSheetController = AnimationController(vsync: this, duration: _duration);
  }

  @override
  Widget build(BuildContext context) {
    FragmentManager().setRoutes(<String, Widget>{
      PageScreenSections: ScreenSections(),
      PageScreenPosts:ScreenPosts()
    });
    return BlocBuilder<FragmentBloc, FragmentState>(
        builder: (BuildContext context, FragmentState state) {
          //final Fragment currentFragment = _buildCurrentFragment(state);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: ApplicationToolbar(
                title: Fa.appName,
              ),
              body: WillPopScope(
                onWillPop: () {
                  BlocProvider.of<FragmentBloc>(context)
                      .dispatch(FragmentBackEvent());
                  return FragmentManager().backPop();
                },
                child: _buildCurrentFragment(state),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              floatingActionButton: GestureDetector(
                child: FloatingActionButton(
                  child: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: _draggableBottomSheetController),
                  elevation: 5,
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  onPressed: () => controller.swap(),
                ),
              ),
              bottomNavigationBar: BottomExpandableAppBar(
                expandedHeight: 350,
                horizontalMargin: 3,
                bottomOffset: 10.0,
                controller: controller,
                attachSide: Side.Bottom,
                shape: AutomaticNotchedShape(RoundedRectangleBorder(), StadiumBorder(side: BorderSide())),
                expandedBackColor: Theme.of(context).backgroundColor,
                expandedBody: Center(
                  child: Stack(children: <Widget>[
                    Text("Hello world!"),
                  ]),
                ),
                bottomAppBarBody: Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(width: 20.0),
                      RaisedButton(
                          color: Colors.white,
                          child: Text(
                            'documents',
                            style: Theme.of(context).textTheme.caption.copyWith(fontFamily: 'IranSansLight', color: Colors.black),
                          ),
                          onPressed: () => BlocProvider.of<FragmentBloc>(context).dispatch(FragmentNavigateEvent(PageScreenPosts)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))),
                      SizedBox(width: 50.0),
                      RaisedButton(
                          color: Colors.white,
                          child: Text(
                            'sections',
                            style: Theme.of(context).textTheme.caption.copyWith(fontFamily: 'IranSansLight', color: Colors.black),
                          ),
                          onPressed: () => BlocProvider.of<FragmentBloc>(context).dispatch(FragmentNavigateEvent(PageScreenSections)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))),
                      SizedBox(width: 20.0),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
  Fragment _buildCurrentFragment(FragmentState state) {
    if (state is FragmentCurrentState) {
      return FragmentManager().getCurrentFragment(state.index);
    } else if (state is FragmentBackState) {
      return FragmentManager().getCurrentFragment(state.index);
    } else {
      return FragmentManager().getCurrentFragment(0);
    }
  }
}
