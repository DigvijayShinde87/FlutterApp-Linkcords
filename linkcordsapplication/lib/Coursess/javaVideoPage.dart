import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Javavideopage extends StatefulWidget {
  const Javavideopage({super.key, required this.videoId});

  final String videoId;

  @override
  State<Javavideopage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Javavideopage> {
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
                  "   Java Lecture: ",
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
              Expanded(
                child: Container(
                  //color: Colors.amber,
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
                          const Text(
                            "Java Overview ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            child: const Text(
                                "    Java is an object-oriented, class-based, general-purpose programming language.  It is platform-independent, which means Java programs can run on any device that has the Java Virtual Machine (JVM) installed."),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Data Types",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            child: const Text(
                                " Primitive Data Types: byte, short, int, long, float, double, char, boolean"),
                          ),
                          Container(
                            child: const Text(
                                " Reference Data Types: Objects (like arrays, classes, etc.)"),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Variables",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            child: const Text(
                                "In Java, you must declare a variable with a type before using it."),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Types of Variables in Java",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(".Local Variables "),
                          const Text("Instance Variables"),
                          const Text("Class (Static) Variables"),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Local Variables",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                              "Local variables are declared inside a method, constructor, or block of code. "),
                          const Text(
                              "They are only accessible within the method/block where they are declared."),
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
