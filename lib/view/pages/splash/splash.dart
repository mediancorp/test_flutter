import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_test/util/assets.dart';
import 'package:project_test/util/colors.dart';
import 'package:project_test/util/router.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

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
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              image: AssetImage(Assets.appLogoBg), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              child: Image(image: AssetImage(Assets.appLogo)),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            SizedBox(
              height: 20,
            ),
            SleekCircularSlider(
              min: 0,
              max: 100,
              initialValue: 100,
              appearance: CircularSliderAppearance(
                infoProperties: InfoProperties(
                    mainLabelStyle: TextStyle(
                  color: AppColors.orange[500],
                  fontSize: 25,
                )),
                customColors: CustomSliderColors(
                    dotColor: Colors.white,
                    progressBarColor: Colors.black,
                    shadowColor: AppColors.orange[300],
                    trackColor: AppColors.orange[600]),
                spinnerDuration: 5,
                animDurationMultiplier: 5,
                animationEnabled: true,
                startAngle: 0.0,
                angleRange: 360,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'May the force be with you...',
              style: TextStyle(color: AppColors.orange[900], fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }

  startTimer() {
    var _duration = Duration(milliseconds: 10000);
    return Timer(_duration, navigate);
  }

  navigate() async {
    Navigate.pushPageReplacement(context, MyHomePage());
  }
}
