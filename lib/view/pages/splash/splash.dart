import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_test/util/assets.dart';
import 'package:project_test/util/colors.dart';
import 'package:project_test/util/router.dart';

import '../my_home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: new Stack(
        alignment:FractionalOffset.center,
        children: <Widget>[
          new Positioned(
            child: Image(
                image: AssetImage(Assets.appLogo)),),
          new Positioned(
            child: Image(
                image: AssetImage(Assets.appLogoBg)),)
        ],
      ),
      color: AppColors.blue[50],
    );
  }

  startTimer() {
    var _duration = Duration(milliseconds: 3000);
    return Timer(_duration, navigate);
  }

  navigate() async {
    Navigate.pushPageReplacement(context, MyHomePage());
  }
}