import 'package:story_shop/views/gallery.dart';
import 'package:story_shop/views/home.dart';
import 'package:flutter/material.dart';
import 'package:story_shop/views/init.dart';

Map<String, Widget Function(BuildContext)> routes = {
  "init": (_) => VInit(),
  "home": (_) => VHome(),
  "gallery": (_) => VGallery(),
};
