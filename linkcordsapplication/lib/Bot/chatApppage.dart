import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:linkcordsapplication/Bot/ChattWithBot.dart';
import 'package:lottie/lottie.dart';

class Chatapppage extends StatelessWidget {
  const Chatapppage({super.key});

  @override
  Widget build(BuildContext context) {
    // navigate(context);
    return AnimatedSplashScreen(
      duration: 3000,
      splash: Lottie.asset("assets/GemePageSplach.json"),
      nextScreen: const Chattwithbot(),
      splashIconSize: 300,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.blue,
    );
  }
}
