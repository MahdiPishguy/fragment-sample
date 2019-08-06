import 'package:flutter/material.dart';
import 'package:kelide_jazzb/backend/localization/fa.dart';

class ApplicationToolbar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  ApplicationToolbar({this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        elevation:0.0,
        titleSpacing: 0.0,
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: Stack(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:12.0),
                    child: Image.asset(
                      'assets/images/key.png',
                      width: 40.0,
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            title,
                            style: Theme.of(context).textTheme.subtitle.copyWith(
                                  fontFamily: 'IranSansBold',
                                  color: Colors.yellow,
                                ),
                          ),
                        ),
                        Text(Fa.appDescription,
                            overflow:TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.overline.copyWith(
                                  fontFamily: 'IranSansLight',
                                  color: Colors.white,
                                )),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
