import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:linkcordsapplication/GameHub/Game2.dart';
import 'package:lottie/lottie.dart';

class Game2Splachscreen extends StatelessWidget {
  const Game2Splachscreen({super.key});

  // void navigate(BuildContext context) {
  //   Future.delayed(const Duration(seconds: 3), () async {
  //     bool status = false;

  //     Navigator.of(context)
  //         .pushReplacement(MaterialPageRoute(builder: (context) {
  //       return QuizeApp();
  //     }));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // navigate(context);
    return AnimatedSplashScreen(
      duration: 3000,
      splash: Lottie.asset("assets/GemePageSplach.json"),
      nextScreen: const QuizApp(),
      splashIconSize: 300,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.blue,
    );

    // Scaffold(
    //   body: Center(
    //     child: SizedBox(
    //       width: 250,
    //       height: 250,
    //       child: Image.network(
    //           "https://static.vecteezy.com/system/resources/previews/023/986/970/non_2x/linkedin-logo-linkedin-logo-transparent-linkedin-icon-transparent-free-free-png.png"),
    //     ),
    //   ),
    // );
  }
}
