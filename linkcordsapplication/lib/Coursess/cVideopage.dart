import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Cvideopage extends StatefulWidget {
  const Cvideopage({super.key, required this.videoId});

  final String videoId;

  @override
  State<Cvideopage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Cvideopage> {
  late final YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ));

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(010),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.white, Colors.blue])),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "   C/C++ Lecture: ",
                  style: GoogleFonts.abhayaLibre(
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 280,
                width: 500,
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 400,
                            child: const Text(
                              "-------------------------------------------------------------",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Video 1 notes:",
                                  style: GoogleFonts.quicksand(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Basic Structure of a C Program",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                              "If you're referring to basic notes in C programming, I can give you an overview of the key concepts to help you get started:"),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Data Types C",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                              ".int: Represents integer values (whole numbers)."),
                          const Text(
                              ". float: Represents floating-point numbers (decimal values).)"),
                          const Text(
                              ".double: Represents double precision floating-point numbers."),
                          const Text(".char: Represents single characters."),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Variables and Constants",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                              ".Variables: Storage locations that hold values of a specific data type"),
                          const Text(
                              ".Constants: Fixed values that cannot be changed during program execution (defined using const keyword or #define)."),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Control Structures",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                              ".If-else statement: Used for conditional branching"),
                          const Text(
                              ".Switch case: Allows multi-way branching."),
                          const Text(
                              ".Loops: for, while, and do-while for repeating actions"),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
