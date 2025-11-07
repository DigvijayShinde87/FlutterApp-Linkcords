import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class pyvideos extends StatefulWidget {
  const pyvideos({super.key, required this.videoId});

  final String videoId;

  @override
  State<pyvideos> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<pyvideos> {
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
                  "  Python Lecture: ",
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
                  )),
              const SizedBox(
                height: 20,
              ),
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
                            "Basic Structure of a python language",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                              "If you're referring to basic notes in python programming, I can give you an overview of the key concepts to help you get started:"),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Data Types python",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                              "Lists:Lists are ordered, mutable collections of items."),
                          const Text(
                              "Tuples:Tuples are ordered, immutable collections of items."),
                          const Text(
                              "Dictionaries:Dictionaries store key-value pairs."),
                          const Text(
                              " Error Handling (Exceptions):Python uses try and except blocks to handle errors."),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "key point of python language",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text("Class: A blueprint for creating objects"),
                          const Text(
                              "Object: An instance of a class with specific data"),
                          const Text(
                              "Constructor (_init_): Special method used to initialize an object's attributes."),
                          const Text(
                              "Inheritance: A way for one class to inherit methods and attributes from another class."),
                          const Text(
                              "Encapsulation: Bundling data and methods in a class and restricting access to internal details."),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Control Structures",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('''1) Conditional Statements:
                                 i.if-else statement: Used for conditional branching
                                  Code:
                                   if condition:
                                   # Execute this block if the condition is true
                                                   
                                ii.elif (else if) statement:
                                  code:
                                   if condition:
                                   # Execute if condition is true
                                   elif another_condition:
                                   # Execute if another condition is true
                                                   '''),
                          const Text(
                              '''2) Loops:Used to repeat a block of code multiple times.
                                  i.for loop:Iterates over a sequence (list, tuple, string, etc.)
                                  Code:
                                   for item in iterable:
                                   # Execute this block for each item in iterable
                                               
                                 ii.while loop:Repeats as long as a condition is true.
                                   Code:
                                    while condition:
                                    # Execute this block while condition is true
                                            '''),
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
