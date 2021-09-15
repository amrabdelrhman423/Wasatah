import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wasatah/Screen/Intro/IntroScreen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: Center(
          child: AnimatedSplashScreen(
              splashIconSize: 250,
              duration: 2000,
              splash: Container(
                  child:  Image.asset("assets/logo.png",
                    alignment: Alignment.center,
                  scale: 3,
                  )),
              nextScreen: IntroScreen(),
              splashTransition: SplashTransition.scaleTransition,
              pageTransitionType: PageTransitionType.rightToLeft,
          ),
        ),
      ),
    );
  }
}
