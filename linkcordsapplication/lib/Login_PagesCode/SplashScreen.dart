import 'dart:developer';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:linkcordsapplication/Login_PagesCode/LoginPageUI.dart';
import 'package:linkcordsapplication/Login_PagesCode/SessionData.dart';
import 'package:linkcordsapplication/root_page.dart';
import 'package:lottie/lottie.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    log('in InitState');
    getData();
    setState(() {});
  }

  late DocumentSnapshot currentLoggedInuserdata;

  void getData() async {
    log("In Get Method");

    await SessionData.getSessionData();
    log("${SessionData.isLogin}");
    log('${SessionData.emailId}');
    currentLoggedInuserdata = await FirebaseFirestore.instance
        .collection("userInfo")
        .doc(SessionData.emailId)
        .get();

    log("Data Send");
    setState(() {});
  }

  void navigate(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 1),
      () async {
        await SessionData.getSessionData();

        log("IS LOGINN: ${SessionData.isLogin}");

        if (SessionData.isLogin!) {
          log("IN HOME");
          log("Email Id: ${currentLoggedInuserdata['userEmailid']}");

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return RootPage(
                  email: currentLoggedInuserdata['userEmailid'],
                  picUR: currentLoggedInuserdata['profilepic'],
                  username: currentLoggedInuserdata['UserName'],
                  bio: currentLoggedInuserdata['bio'],
                  location: currentLoggedInuserdata['location'],
                );
              },
            ),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return const LoginScreenUI();
              },
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    navigate(context);
    return AnimatedSplashScreen(
      duration: 5000,
      splash: Lottie.asset("assets/Animation - 1731750840361.json"),
      nextScreen: const LoginScreenUI(),
      splashIconSize: 300,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.blue,
    );
  }
}
