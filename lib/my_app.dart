
import 'package:flutter/material.dart';
import 'package:project_test/view/pages/splash/splash.dart';
import 'package:project_test/view/utils/theme_config.dart';

class MyApp extends StatelessWidget {
  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeConfig.lightTheme,
      home: SplashScreen(),
    );
  }
}
