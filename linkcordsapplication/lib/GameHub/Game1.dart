import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

bool oTurn = true;
int boxes = 0;
int Oscore = 0;
int Xscore = 0;

class _TicTacToeState extends State<TicTacToe> {
  final List<String> play = ['', '', '', '', '', '', '', '', ''];

  void tapped(int index) {
    setState(() {
      if (oTurn && play[index] == '') {
        play[index] = 'O';
        boxes++;
      } else if (!oTurn && play[index] == '') {
        play[index] = 'X';
        boxes++;
      }
      oTurn = !oTurn;
      checkwinner();
    });
  }

  void checkwinner() {
    if (play[0] == play[1] && play[0] == play[2] && play[0] != '') {
      showwinner(play[0]);
    }
    if (play[3] == play[4] && play[3] == play[5] && play[3] != '') {
      showwinner(play[3]);
    }
    if (play[6] == play[7] && play[6] == play[8] && play[6] != '') {
      showwinner(play[6]);
    }
    if (play[0] == play[3] && play[0] == play[6] && play[0] != '') {
      showwinner(play[0]);
    }
    if (play[1] == play[7] && play[1] == play[4] && play[1] != '') {
      showwinner(play[1]);
    }
    if (play[2] == play[5] && play[2] == play[8] && play[2] != '') {
      showwinner(play[2]);
    }
    if (play[0] == play[8] && play[0] == play[4] && play[0] != '') {
      showwinner(play[0]);
    }
    if (play[2] == play[4] && play[2] == play[6] && play[2] != '') {
      showwinner(play[2]);
    } else if (boxes == 9) {
      matchDraw();
    }
  }

  void matchDraw() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Match Draw"),
            actions: <Widget>[
              FloatingActionButton(
                child: const Icon(Icons.replay_outlined),
                onPressed: () {
                  tryAgain();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
    log("WINNER");
  }

  void showwinner(String winnerName) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Winner is: $winnerName"),
            actions: <Widget>[
              FloatingActionButton(
                child: const Icon(Icons.replay_outlined),
                onPressed: () {
                  tryAgain();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });

    if (winnerName == 'O') {
      Oscore++;
    } else if (winnerName == 'X') {
      Xscore++;
    }
    log("WINNER");
  }

  void replay() {
    Oscore = 0;
    Xscore = 0;
    tryAgain();
    setState(() {});
  }

  void tryAgain() {
    for (int i = 0; i < 9; i++) {
      play[i] = '';
    }
    setState(() {});
    boxes = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 110, 10, 127),
      // appBar: AppBar(
      //   title: Text(
      //     "GameHub..!!",
      //     style: GoogleFonts.quicksand(
      //         fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
      //   ),
      //   backgroundColor: Colors.black,
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromARGB(255, 8, 184, 184),
                Color.fromARGB(255, 216, 101, 139),
                Color.fromARGB(255, 108, 246, 158),
              ])),
          child: Column(
            children: [
              const SizedBox(
                height: 85,
              ),
              Expanded(
                  child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    // child: TextLiquidFill(
                    //   text: "TicTacToe",
                    //   textAlign: TextAlign.center,
                    //   waveColor: Colors.blueAccent,
                    //   boxBackgroundColor: Colors.white,
                    //   boxHeight: 65,
                    //   boxWidth: 270,
                    //   textStyle: GoogleFonts.aclonica(
                    //       fontSize: 50, fontWeight: FontWeight.bold),
                    //   loadUntil: 1.0,
                    //   loadDuration: const Duration(seconds: 2),
                    //   waveDuration: const Duration(seconds: 1),
                    // ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('Tic-Tak-Toe',
                            textStyle: GoogleFonts.andika(
                                letterSpacing: 3,
                                fontSize: 40,
                                fontWeight: FontWeight.w800,
                                color: Colors.black),
                            speed: const Duration(milliseconds: 600)),
                      ],
                      repeatForever: true,
                      isRepeatingAnimation: true,
                      totalRepeatCount: 10,
                      pause: const Duration(milliseconds: 1200),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Player X: ",
                                style: GoogleFonts.quicksand(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                Xscore.toString(),
                                style: GoogleFonts.quicksand(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 45),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Player O: ",
                                style: GoogleFonts.quicksand(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                Oscore.toString(),
                                style: GoogleFonts.quicksand(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
              const SizedBox(
                height: 39,
              ),
              Expanded(
                flex: 3,
                child: GridView.builder(
                    padding: const EdgeInsets.all(7),
                    itemCount: 9,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          tapped(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: Text(
                              play[index],
                              style: GoogleFonts.actor(
                                fontSize: 45,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: replay,
        splashColor: Colors.white,
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.replay_outlined,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
