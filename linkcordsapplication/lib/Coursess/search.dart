// import 'dart:developer';

// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:avatar_glow/avatar_glow.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:linkcordsapplication/Coursess/C_Course.dart';
// import 'package:linkcordsapplication/Coursess/JavaCourse.dart';
// import 'package:linkcordsapplication/Coursess/PYCourse.dart';
// import 'package:linkcordsapplication/Coursess/webCourse.dart';
// import 'package:lottie/lottie.dart';

// class Myskillui extends StatefulWidget {
//   const Myskillui({super.key});

//   @override
//   State<StatefulWidget> createState() => _mySkillUIState();
// }

// class _mySkillUIState extends State<Myskillui> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//             gradient: LinearGradient(
//                 begin: Alignment.center,
//                 end: Alignment.bottomRight,
//                 colors: [
//               Color.fromARGB(255, 243, 240, 240),
//               Color.fromARGB(255, 188, 212, 249),
//             ])),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(
//               height: 30,
//             ),
//             Container(
//               width: 340,
//               decoration: const BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black,
//                     blurRadius: 2,
//                     spreadRadius: 2.1,
//                   )
//                 ],
//               ),
//               alignment: Alignment.center,
//               child: AnimatedTextKit(
//                 animatedTexts: [
//                   ColorizeAnimatedText(' UpGrade Your Skill   ',
//                       textStyle: GoogleFonts.abhayaLibre(
//                         fontSize: 40,
//                         fontWeight: FontWeight.w800,
//                         color: Colors.white,
//                         backgroundColor:
//                             const Color.fromARGB(255, 163, 234, 250),
//                       ),
//                       colors: [
//                         const Color.fromARGB(255, 0, 0, 0),
//                         Colors.blue,
//                         Colors.white,
//                         Colors.purple
//                       ]),
//                 ],
//                 repeatForever: true,
//                 isRepeatingAnimation: true,
//                 totalRepeatCount: 20,
//                 pause: const Duration(milliseconds: 700),
//               ),
//             ),
//             const SizedBox(
//               height: 45,
//             ),
//             Container(
//               width: 250,
//               height: 50,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30),
//                   color: const Color.fromARGB(255, 152, 208, 254),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Colors.black,
//                       blurRadius: 3,
//                       spreadRadius: 2.1,
//                     )
//                   ]),
//               child: AnimatedTextKit(
//                 animatedTexts: [
//                   TypewriterAnimatedText('Courses: ',
//                       textStyle: GoogleFonts.andika(
//                           letterSpacing: 3,
//                           fontSize: 25,
//                           fontWeight: FontWeight.w800,
//                           color: Colors.black),
//                       speed: const Duration(milliseconds: 600)),
//                 ],
//                 repeatForever: true,
//                 isRepeatingAnimation: true,
//                 totalRepeatCount: 10,
//                 pause: const Duration(milliseconds: 1200),
//               ),
//             ),
//             const SizedBox(
//               height: 50,
//             ),
//             Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Container(
//                     // color: Colors.black,
//                     height: 210,
//                     width: 700,
//                     // width: MediaQuery.of(context).size.width,
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             log("HELLO");

//                             setState(() {
//                               AnimatedSplashScreen(
//                                 duration: 3000,
//                                 splash:
//                                     Lottie.asset("assets/GemePageSplach.json"),
//                                 nextScreen: const C_Course(),
//                                 splashIconSize: 300,
//                                 splashTransition:
//                                     SplashTransition.fadeTransition,
//                                 backgroundColor: Colors.blue,
//                               );

//                               Navigator.of(context)
//                                   .push(MaterialPageRoute(builder: (context) {
//                                 return const Javacourse();
//                               }));
//                               // Navigator.push.
//                             });
//                           },
//                           child: AvatarGlow(
//                             glowRadiusFactor: 0.2,
//                             glowColor: Colors.white,
//                             // glowBorderRadius: BorderRadius.circular(0.2),
//                             glowShape: BoxShape.rectangle,
//                             child: Container(
//                               // color: Colors.amber,
//                               decoration: const BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                         spreadRadius: 1,
//                                         blurRadius: 1,
//                                         color: Colors.black)
//                                   ],
//                                   gradient: LinearGradient(
//                                       begin: Alignment.topLeft,
//                                       end: Alignment.bottomRight,
//                                       colors: [
//                                         Color.fromARGB(255, 188, 212, 249),
//                                         Color.fromARGB(255, 188, 212, 249),
//                                       ])),
//                               height: 200,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   const SizedBox(
//                                     height: 20,
//                                   ),
//                                   Container(
//                                     height: 70,
//                                     width: 150,
//                                     decoration: const BoxDecoration(
//                                       color: Colors.black,
//                                       shape: BoxShape.circle,
//                                     ),
//                                     clipBehavior: Clip.antiAlias,
//                                     child: Image.network(
//                                         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNpVZLBopM6a3xmPJHCwNT-yVFs4vd5sLs01-ykyQ5hsS6UML2Qe-QpPsVKv3a6ktr5tM&usqp=CAU"),
//                                   ),
//                                   const SizedBox(
//                                     height: 20,
//                                   ),
//                                   AnimatedTextKit(
//                                     animatedTexts: [
//                                       TypewriterAnimatedText('JAVA',
//                                           textStyle: GoogleFonts.quicksand(
//                                               letterSpacing: 3,
//                                               fontSize: 25,
//                                               fontWeight: FontWeight.w800,
//                                               color: Colors.black),
//                                           speed: const Duration(
//                                               milliseconds: 600)),
//                                     ],
//                                     repeatForever: true,
//                                     isRepeatingAnimation: true,
//                                     totalRepeatCount: 10,
//                                     pause: const Duration(milliseconds: 1200),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 50,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             log("HELLO");

//                             setState(() {
//                               AnimatedSplashScreen(
//                                 duration: 3000,
//                                 splash:
//                                     Lottie.asset("assets/GemePageSplach.json"),
//                                 nextScreen: const Javacourse(),
//                                 splashIconSize: 300,
//                                 splashTransition:
//                                     SplashTransition.fadeTransition,
//                                 backgroundColor: Colors.blue,
//                               );

//                               Navigator.of(context)
//                                   .push(MaterialPageRoute(builder: (context) {
//                                 return const C_Course();
//                               }));
//                               // Navigator.push.
//                             });
//                           },
//                           child: AvatarGlow(
//                             glowRadiusFactor: 0.2,
//                             glowColor: Colors.white,
//                             // glowBorderRadius: BorderRadius.circular(0.2),
//                             glowShape: BoxShape.rectangle,
//                             child: Container(
//                               decoration: const BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                         spreadRadius: 1,
//                                         blurRadius: 1,
//                                         color: Colors.black)
//                                   ],
//                                   gradient: LinearGradient(
//                                       begin: Alignment.topLeft,
//                                       end: Alignment.bottomRight,
//                                       colors: [
//                                         Color.fromARGB(255, 188, 212, 249),
//                                         Color.fromARGB(255, 188, 212, 249),
//                                       ])),
//                               height: 200,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   const SizedBox(
//                                     height: 20,
//                                   ),
//                                   Container(
//                                     height: 70,
//                                     width: 150,
//                                     decoration: const BoxDecoration(
//                                       color: Colors.black,
//                                       shape: BoxShape.circle,
//                                     ),
//                                     clipBehavior: Clip.antiAlias,
//                                     child: Image.network(
//                                         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4lwrxofkVF3J44hurl9rWSBm0VwE2qHTCXkb-dfl6qdb5If2S_dWsILC1UEBDkYkaJSw&usqp=CAU"),
//                                   ),
//                                   const SizedBox(
//                                     height: 20,
//                                   ),
//                                   AnimatedTextKit(
//                                     animatedTexts: [
//                                       TypewriterAnimatedText('C/C++',
//                                           textStyle: GoogleFonts.quicksand(
//                                               letterSpacing: 3,
//                                               fontSize: 25,
//                                               fontWeight: FontWeight.w800,
//                                               color: Colors.black),
//                                           speed: const Duration(
//                                               milliseconds: 600)),
//                                     ],
//                                     repeatForever: true,
//                                     isRepeatingAnimation: true,
//                                     totalRepeatCount: 10,
//                                     pause: const Duration(milliseconds: 1200),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.of(context)
//                               .push(MaterialPageRoute(builder: (context) {
//                             return const Webcourse();
//                           }));
//                         },
//                         child: AvatarGlow(
//                           glowRadiusFactor: 0.2,
//                           glowColor: Colors.white,
//                           // glowBorderRadius: BorderRadius.circular(0.2),
//                           glowShape: BoxShape.rectangle,
//                           child: Container(
//                             decoration: const BoxDecoration(
//                                 boxShadow: [
//                                   BoxShadow(
//                                       spreadRadius: 1,
//                                       blurRadius: 1,
//                                       color: Colors.black)
//                                 ],
//                                 gradient: LinearGradient(
//                                     begin: Alignment.topLeft,
//                                     end: Alignment.bottomRight,
//                                     colors: [
//                                       Color.fromARGB(255, 188, 212, 249),
//                                       Color.fromARGB(255, 188, 212, 249),
//                                     ])),
//                             height: 200,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 const SizedBox(
//                                   height: 20,
//                                 ),
//                                 Container(
//                                   height: 70,
//                                   width: 150,
//                                   decoration: const BoxDecoration(
//                                     color: Colors.black,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   clipBehavior: Clip.antiAlias,
//                                   child: Image.network(
//                                       "https://t3.ftcdn.net/jpg/03/21/24/30/360_F_321243084_GstfWflk1eTLlzUdRZ5mjoP5IG1iCc8J.jpg"),
//                                 ),
//                                 const SizedBox(
//                                   height: 20,
//                                 ),
//                                 AnimatedTextKit(
//                                   animatedTexts: [
//                                     TypewriterAnimatedText('Web-Dev',
//                                         textStyle: GoogleFonts.quicksand(
//                                             letterSpacing: 3,
//                                             fontSize: 25,
//                                             fontWeight: FontWeight.w800,
//                                             color: Colors.black),
//                                         speed:
//                                             const Duration(milliseconds: 600)),
//                                   ],
//                                   repeatForever: true,
//                                   isRepeatingAnimation: true,
//                                   totalRepeatCount: 10,
//                                   pause: const Duration(milliseconds: 1200),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 50,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           log("HELLO");

//                           setState(() {
//                             AnimatedSplashScreen(
//                               duration: 3000,
//                               splash:
//                                   Lottie.asset("assets/GemePageSplach.json"),
//                               nextScreen: const Javacourse(),
//                               splashIconSize: 300,
//                               splashTransition: SplashTransition.fadeTransition,
//                               backgroundColor: Colors.blue,
//                             );

//                             Navigator.of(context)
//                                 .push(MaterialPageRoute(builder: (context) {
//                               return const Pycourse();
//                             }));
//                             // Navigator.push.
//                           });
//                         },
//                         child: AvatarGlow(
//                           glowRadiusFactor: 0.2,
//                           glowColor: Colors.white,
//                           // glowBorderRadius: BorderRadius.circular(0.2),
//                           glowShape: BoxShape.rectangle,
//                           child: Container(
//                             // color: Colors.amber,
//                             decoration: const BoxDecoration(
//                                 boxShadow: [
//                                   BoxShadow(
//                                       spreadRadius: 1,
//                                       blurRadius: 1,
//                                       color: Colors.black)
//                                 ],
//                                 gradient: LinearGradient(
//                                     begin: Alignment.topLeft,
//                                     end: Alignment.bottomRight,
//                                     colors: [
//                                       Color.fromARGB(255, 188, 212, 249),
//                                       Color.fromARGB(255, 188, 212, 249),
//                                     ])),
//                             height: 200,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 const SizedBox(
//                                   height: 20,
//                                 ),
//                                 Container(
//                                   height: 70,
//                                   width: 150,
//                                   decoration: const BoxDecoration(
//                                     color: Colors.black,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   clipBehavior: Clip.antiAlias,
//                                   child: Image.network(
//                                       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYZqZkpMyiN2uSuT7GAf6JSkJ44YsZqoQHdw&s"),
//                                 ),
//                                 const SizedBox(
//                                   height: 20,
//                                 ),
//                                 AnimatedTextKit(
//                                   animatedTexts: [
//                                     TypewriterAnimatedText('PYTHON',
//                                         textStyle: GoogleFonts.quicksand(
//                                             letterSpacing: 3,
//                                             fontSize: 25,
//                                             fontWeight: FontWeight.w800,
//                                             color: Colors.black),
//                                         speed:
//                                             const Duration(milliseconds: 600)),
//                                   ],
//                                   repeatForever: true,
//                                   isRepeatingAnimation: true,
//                                   totalRepeatCount: 10,
//                                   pause: const Duration(milliseconds: 1200),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 20,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkcordsapplication/Coursess/C_Course.dart';
import 'package:linkcordsapplication/Coursess/JavaCourse.dart';
import 'package:linkcordsapplication/Coursess/PYCourse.dart';
import 'package:linkcordsapplication/Coursess/webCourse.dart';
import 'package:lottie/lottie.dart';

class Myskillui extends StatefulWidget {
  const Myskillui({super.key});

  @override
  State<StatefulWidget> createState() => _mySkillUIState();
}

class _mySkillUIState extends State<Myskillui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                child: AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'UpGrade Your Skill',
                      textStyle: GoogleFonts.abhayaLibre(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                      colors: [
                        Colors.black,
                        Colors.blueAccent,
                        Colors.deepPurple,
                        Colors.teal,
                      ],
                    )
                  ],
                  isRepeatingAnimation: true,
                  repeatForever: true,
                  pause: const Duration(milliseconds: 700),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 5,
                          offset: const Offset(2, 4))
                    ]),
                height: 50,
                width: 200,
                alignment: Alignment.center,
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Courses:',
                      textStyle: GoogleFonts.andika(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: Colors.black),
                      speed: const Duration(milliseconds: 600),
                    )
                  ],
                  isRepeatingAnimation: true,
                  repeatForever: true,
                ),
              ),
              const SizedBox(height: 40),
              // FIRST ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCourseCard(
                    title: "JAVA",
                    image:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNpVZLBopM6a3xmPJHCwNT-yVFs4vd5sLs01-ykyQ5hsS6UML2Qe-QpPsVKv3a6ktr5tM&usqp=CAU",
                    onTap: () {
                      setState(() {
                        AnimatedSplashScreen(
                          duration: 3000,
                          splash: Lottie.asset("assets/GemePageSplach.json"),
                          nextScreen: const C_Course(),
                          splashIconSize: 300,
                          splashTransition: SplashTransition.fadeTransition,
                          backgroundColor: Colors.blue,
                        );
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const Javacourse();
                        }));
                      });
                    },
                  ),
                  _buildCourseCard(
                    title: "C/C++",
                    image:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4lwrxofkVF3J44hurl9rWSBm0VwE2qHTCXkb-dfl6qdb5If2S_dWsILC1UEBDkYkaJSw&usqp=CAU",
                    onTap: () {
                      log("HELLO");
                      setState(() {
                        AnimatedSplashScreen(
                          duration: 3000,
                          splash: Lottie.asset("assets/GemePageSplach.json"),
                          nextScreen: const Javacourse(),
                          splashIconSize: 300,
                          splashTransition: SplashTransition.fadeTransition,
                          backgroundColor: Colors.blue,
                        );
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const C_Course();
                        }));
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // SECOND ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCourseCard(
                    title: "Web-Dev",
                    image:
                        "https://t3.ftcdn.net/jpg/03/21/24/30/360_F_321243084_GstfWflk1eTLlzUdRZ5mjoP5IG1iCc8J.jpg",
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const Webcourse();
                      }));
                    },
                  ),
                  _buildCourseCard(
                    title: "PYTHON",
                    image:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYZqZkpMyiN2uSuT7GAf6JSkJ44YsZqoQHdw&s",
                    onTap: () {
                      log("HELLO");
                      setState(() {
                        AnimatedSplashScreen(
                          duration: 3000,
                          splash: Lottie.asset("assets/GemePageSplach.json"),
                          nextScreen: const Javacourse(),
                          splashIconSize: 300,
                          splashTransition: SplashTransition.fadeTransition,
                          backgroundColor: Colors.blue,
                        );
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const Pycourse();
                        }));
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCourseCard({
    required String title,
    required String image,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AvatarGlow(
        glowRadiusFactor: 0.2,
        glowColor: Colors.white,
        glowShape: BoxShape.rectangle,
        child: Container(
          height: 190,
          width: 150,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12, blurRadius: 4, offset: Offset(2, 4))
            ],
          ),
          child: Column(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.network(image, fit: BoxFit.cover),
              ),
              const SizedBox(height: 20),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    title,
                    textStyle: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: Colors.black87,
                    ),
                    speed: const Duration(milliseconds: 400),
                  ),
                ],
                totalRepeatCount: 10,
                isRepeatingAnimation: true,
                pause: const Duration(milliseconds: 1000),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
