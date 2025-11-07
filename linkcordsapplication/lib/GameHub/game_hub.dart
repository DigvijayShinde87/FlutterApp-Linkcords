// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:linkcordsapplication/GameHub/Game2Splash.dart';
// import 'package:linkcordsapplication/GameHub/tictaktoesplach.dart';
// import 'package:page_transition/page_transition.dart';

// class GameHub extends StatefulWidget {
//   const GameHub({super.key});

//   @override
//   State<GameHub> createState() => _GameHubState();
// }

// class _GameHubState extends State<GameHub> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         decoration: const BoxDecoration(
//             gradient: LinearGradient(
//                 begin: Alignment.center,
//                 end: Alignment.bottomRight,
//                 colors: [
//               Color.fromARGB(255, 243, 240, 240),
//               Color.fromARGB(255, 188, 212, 249),
//               // Color.fromARGB(255, 216, 101, 139),
//               // Color.fromARGB(255, 108, 246, 158),
//             ])),
//         child: Padding(
//           padding: const EdgeInsets.all(18.0),
//           child: Column(
//             children: [
//               Container(
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: const Color.fromARGB(255, 188, 212, 249),
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Color.fromRGBO(0, 0, 0, 1),
//                         blurRadius: 2,
//                         spreadRadius: -2,
//                         offset: Offset(
//                           0,
//                           20,
//                         ),
//                       ),
//                     ]),
//                 height: 100,
//                 width: 300,
//                 child: AnimatedTextKit(
//                   animatedTexts: [
//                     ColorizeAnimatedText('Game Zone',
//                         textStyle: GoogleFonts.hanaleiFill(
//                           fontSize: 50,
//                           fontWeight: FontWeight.w800,
//                           color: Colors.white,
//                           backgroundColor:
//                               const Color.fromARGB(255, 188, 212, 249),
//                         ),
//                         colors: [
//                           const Color.fromARGB(255, 0, 0, 0),
//                           Colors.blue,
//                           Colors.white,
//                           Colors.purple
//                         ]),
//                   ],
//                   repeatForever: true,
//                   isRepeatingAnimation: true,
//                   totalRepeatCount: 20,
//                   pause: const Duration(milliseconds: 1700),
//                 ),
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               Container(
//                 child: Column(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) {
//                               return const Game1Splachscreen();
//                             },
//                           ),
//                         );
//                       },
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.of(context)
//                               .push(MaterialPageRoute(builder: (context) {
//                             return const Game1Splachscreen();
//                           }));
//                         },
//                         child: Container(
//                             height: 150,
//                             width: 470,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(30),
//                                 color: const Color.fromARGB(255, 188, 212, 249),
//                                 boxShadow: const [
//                                   BoxShadow(
//                                     color: Color.fromRGBO(0, 0, 0, 1),
//                                     blurRadius: 20,
//                                     spreadRadius: -2,
//                                     offset: Offset(
//                                       0,
//                                       20,
//                                     ),
//                                   ),
//                                 ]),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     height: 90,
//                                     width: 125,
//                                     clipBehavior: Clip.antiAlias,
//                                     decoration: const BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: Colors.black,
//                                     ),
//                                     child: Image.network(
//                                         "https://i0.wp.com/images.squarespace-cdn.com/content/v1/54f74f23e4b0952b4e0011c0/1580269334204-W1N8ATYATHA6XP02YVSY/ke17ZwdGBToddI8pDm48kGtxPgPaOBG5VTwzK0O3JPx7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QHyNOqBUUEtDDsRWrJLTmYfwwyaF2qdqpAEW-vwkS-q9yrvcVcBFNcMZ7RZJD-G-L7L3_iLqMJNwF1D5UY19g/tictac.png?w=696&ssl=1"),
//                                   ),
//                                   const SizedBox(
//                                     width: 25,
//                                   ),

//                                   GestureDetector(
//                                     onTap: () {
//                                       Navigator.of(context).push(
//                                           MaterialPageRoute(builder: (context) {
//                                         return const Game1Splachscreen();
//                                       }));
//                                     },
//                                     child: Container(
//                                       child: AnimatedTextKit(
//                                         animatedTexts: [
//                                           // ColorizeAnimatedText('Game Zone',
//                                           //     textStyle: GoogleFonts.hanaleiFill(
//                                           //         fontSize: 50,
//                                           //         fontWeight: FontWeight.w800,
//                                           //         color: Colors.white,
//                                           //         backgroundColor: Colors.purple),
//                                           //     colors: [
//                                           //       const Color.fromARGB(255, 0, 0, 0),
//                                           //       Colors.blue,
//                                           //       Colors.white,
//                                           //       Colors.purple
//                                           //     ]),
//                                           RotateAnimatedText('Tic-Tak-Toe',
//                                               textStyle: const TextStyle(
//                                                   letterSpacing: 3,
//                                                   fontSize: 33,
//                                                   fontWeight: FontWeight.w800,
//                                                   color: Colors.black)),
//                                           // RotateAnimatedText(
//                                           //   'TIC-TAK-TOE',
//                                           //   textStyle: const TextStyle(
//                                           //     fontSize: 30,
//                                           //     decoration: TextDecoration.underline,
//                                           //   ),
//                                           // ),
//                                         ],
//                                         repeatForever: true,
//                                         isRepeatingAnimation: true,
//                                         totalRepeatCount: 10,
//                                         pause:
//                                             const Duration(milliseconds: 1200),
//                                       ),
//                                     ),
//                                   )
//                                   // Text(
//                                   //   "Tic-Tak_Toe",
//                                   //   style: GoogleFonts.quicksand(
//                                   //     fontSize: 30,
//                                   //     color: Colors.white,
//                                   //     fontWeight: FontWeight.w700,
//                                   //   ),
//                                   // )
//                                 ],
//                               ),
//                             )),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 50,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.of(context)
//                             .push(MaterialPageRoute(builder: (context) {
//                           return const Game2Splachscreen();
//                         }));
//                       },
//                       child: Container(
//                           height: 150,
//                           width: 470,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(30),
//                               color: const Color.fromARGB(255, 188, 212, 249),
//                               boxShadow: const [
//                                 BoxShadow(
//                                   color: Color.fromRGBO(0, 0, 0, 1),
//                                   blurRadius: 20,
//                                   spreadRadius: -2,
//                                   offset: Offset(
//                                     0,
//                                     20,
//                                   ),
//                                 ),
//                               ]),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   height: 90,
//                                   width: 125,
//                                   clipBehavior: Clip.antiAlias,
//                                   decoration: const BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: Colors.black,
//                                   ),
//                                   child: Image.network(
//                                       "https://static.vecteezy.com/system/resources/thumbnails/005/292/680/small/quiz-neon-signs-style-text-free-vector.jpg"),
//                                 ),
//                                 const SizedBox(
//                                   width: 15,
//                                 ),

//                                 Container(
//                                   child: AnimatedTextKit(
//                                     animatedTexts: [
//                                       // ColorizeAnimatedText('Game Zone',
//                                       //     textStyle: GoogleFonts.hanaleiFill(
//                                       //         fontSize: 50,
//                                       //         fontWeight: FontWeight.w800,
//                                       //         color: Colors.white,
//                                       //         backgroundColor: Colors.purple),
//                                       //     colors: [
//                                       //       const Color.fromARGB(255, 0, 0, 0),
//                                       //       Colors.blue,
//                                       //       Colors.white,
//                                       //       Colors.purple
//                                       //     ]),
//                                       RotateAnimatedText('Quize Game',
//                                           textStyle: const TextStyle(
//                                               letterSpacing: 3,
//                                               fontSize: 33,
//                                               fontWeight: FontWeight.w800,
//                                               color: Colors.black)),
//                                       // RotateAnimatedText(
//                                       //   'TIC-TAK-TOE',
//                                       //   textStyle: const TextStyle(
//                                       //     fontSize: 30,
//                                       //     decoration: TextDecoration.underline,
//                                       //   ),
//                                       // ),
//                                     ],
//                                     repeatForever: true,
//                                     isRepeatingAnimation: true,
//                                     totalRepeatCount: 10,
//                                     pause: const Duration(milliseconds: 1200),
//                                   ),
//                                 )
//                                 // Text(
//                                 //   "Tic-Tak_Toe",
//                                 //   style: GoogleFonts.quicksand(
//                                 //     fontSize: 30,
//                                 //     color: Colors.white,
//                                 //     fontWeight: FontWeight.w700,
//                                 //   ),
//                                 // )
//                               ],
//                             ),
//                           )),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkcordsapplication/GameHub/Game2Splash.dart';
import 'package:linkcordsapplication/GameHub/tictaktoesplach.dart';

class GameHub extends StatefulWidget {
  const GameHub({super.key});

  @override
  State<GameHub> createState() => _GameHubState();
}

class _GameHubState extends State<GameHub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFB2D8FF),
              Color(0xFFD9EFFF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header
                AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'Game Hub',
                      textStyle: GoogleFonts.bebasNeue(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                      colors: [
                        Colors.white,
                        Colors.blue.shade200,
                        Colors.purpleAccent,
                        Colors.cyan,
                      ],
                    ),
                  ],
                  isRepeatingAnimation: true,
                  repeatForever: true,
                ),

                const SizedBox(height: 40),

                // Game Cards
                Expanded(
                  child: ListView(
                    children: [
                      _buildGameCard(
                        title: "Tic-Tac-Toe",
                        imageUrl:
                            "https://i0.wp.com/images.squarespace-cdn.com/content/v1/54f74f23e4b0952b4e0011c0/1580269334204-W1N8ATYATHA6XP02YVSY/ke17ZwdGBToddI8pDm48kGtxPgPaOBG5VTwzK0O3JPx7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QHyNOqBUUEtDDsRWrJLTmYfwwyaF2qdqpAEW-vwkS-q9yrvcVcBFNcMZ7RZJD-G-L7L3_iLqMJNwF1D5UY19g/tictac.png?w=696&ssl=1",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Game1Splachscreen()));
                        },
                      ),
                      const SizedBox(height: 30),
                      _buildGameCard(
                        title: "Quiz Game",
                        imageUrl:
                            "https://static.vecteezy.com/system/resources/thumbnails/005/292/680/small/quiz-neon-signs-style-text-free-vector.jpg",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Game2Splachscreen()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGameCard({
    required String title,
    required String imageUrl,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white.withOpacity(0.95),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 15,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            ClipOval(
              child: Image.network(
                imageUrl,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.black45),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
