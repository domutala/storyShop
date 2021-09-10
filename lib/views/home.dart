import 'package:story_shop/components/CollectionOne.dart';
import 'package:story_shop/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VHome extends StatefulWidget {
  VHome();

  @override
  _VHomeState createState() => _VHomeState();
}

class _VHomeState extends State<VHome> {
  _VHomeState();

  ScrollController scrollController = ScrollController();
  double _moveDistance = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: xLight,
        systemNavigationBarColor: xPrimary,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: xPrimary,
      ),
    );

    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return Scaffold(
      body: bodyBuilder(),
    );
  }

  Widget bodyBuilder() {
    return Stack(
      children: [
        ListView(
          controller: scrollController,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50, bottom: 30),
              child: Center(
                child: Text(
                  'Collections',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(bottom: 130),
              child: Wrap(
                children: [
                  for (var i = 0; i < 5; i++) CollectionOne(id: i),
                ],
              ),
            )
          ],
        ),
        Positioned(
          top: -140 + _moveDistance,
          left: 0,
          right: 0,
          child: Container(
            height: 140,
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 5),
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            width: double.infinity,
            height: 110,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.3, 1],
                  colors: [
                    xPrimary,
                    xPrimary.withOpacity(1),
                  ],
                ),
              ),
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/logo.svg',
                          width: 48,
                          color: Colors.yellow,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Story \nShop',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: -20,
                    right: 50,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                              color: xDark,
                              borderRadius: BorderRadius.circular(
                                42,
                              )),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/shopping-cart.svg',
                              width: 24,
                              color: xLight,
                            ),
                          ),
                        ),
                        Positioned(
                          top: -5,
                          right: -7,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.yellow,
                            ),
                            child: Center(
                              child: Text(
                                '1',
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
