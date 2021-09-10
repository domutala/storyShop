import 'dart:math';
import 'package:flutter/material.dart';

Color xPrimary = Colors.cyan;
Color xLight = Colors.white;
Color xDark = Colors.black;
Color xScafoldBg = Color(0xFFF3F5F7);

Color randomColor({double alpha = 1}) {
  var r = Random().nextInt(250);
  var g = Random().nextInt(250);
  var b = Random().nextInt(250);

  return Color.fromRGBO(r, g, b, alpha);
}
