import 'package:story_shop/routes/index.dart';
import 'package:story_shop/utils/colors.dart';
import 'package:story_shop/views/init.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: xLight,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: xLight,
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'story_shop',
      theme: ThemeData(
        primaryColor: xPrimary,
        primaryColorLight: xLight,
        primaryColorDark: xDark,
        scaffoldBackgroundColor: xScafoldBg,
        textTheme: TextTheme(bodyText1: TextStyle(color: xDark)),
      ),
      routes: routes,
      home: VInit(),
    );
  }
}
