import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Webvideos extends StatefulWidget {
  const Webvideos({super.key, required this.videoId});

  final String videoId;

  @override
  State<Webvideos> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Webvideos> {
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
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
        ),
        title: Text(
          "Web-Dev 2024",
          style: GoogleFonts.montserrat(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.all(010),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.white, Colors.blue])),
          child: Column(
            children: [
              Container(
                child: Text(
                  "   Web-Dev Lecture ",
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
            ],
          )),
    );
  }
}
