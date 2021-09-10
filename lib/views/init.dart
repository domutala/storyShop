import 'dart:async';

import 'package:story_shop/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VInit extends StatefulWidget {
  VInit();

  @override
  _VInitState createState() => _VInitState();
}

class _VInitState extends State<VInit> {
  _VInitState();

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('home');
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: xPrimary,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: xPrimary,
        systemNavigationBarDividerColor: xPrimary,
      ),
    );

    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    return Scaffold(
      backgroundColor: xPrimary,
      body: bodyBuilder(),
    );
  }

  Widget bodyBuilder() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.cyanAccent,
                xPrimary,
              ],
            ),
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/shopping-cart.svg',
              width: 56,
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          left: 0,
          right: 0,
          child: Center(
            child: CircularProgressIndicator(
              strokeWidth: 1,
              valueColor: AlwaysStoppedAnimation<Color>(xDark),
            ),
          ),
        )
      ],
    );
  }
}
