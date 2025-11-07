import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkcordsapplication/Coursess/pyvideos.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Pycourse extends StatefulWidget {
  const Pycourse({super.key});

  @override
  State<Pycourse> createState() => _UploadPageState();
}

class _UploadPageState extends State<Pycourse> {
  List<String> videoURL = [
    "https://youtu.be/2R3rQ4TwwR0?si=f39zH7hg5bEXHXn3",
    "https://youtu.be/m0MMSjgA3Ag?si=QWW0hztGdJhUxuLS",
    "https://youtu.be/M3Z1ZZDY-NI?si=Gj8iKiPeK2J7bTF2",
    "https://youtu.be/Dsaqxep0BdY?si=YLmfQ9qpsr3s_nlZ",
    "https://youtu.be/NffveItOhJY?si=QwzcplgcbmNgBHbi",
    "https://youtu.be/9eoaX-fehpQ?si=0x07PHXWIUxaAX3r",
    "https://youtu.be/3N0WD7Mol4g?si=15OomsL7uSH7LGEw",
    "https://youtu.be/YcW7x8E5eKs?si=WbtQAitw-A3HCf0G",
    "https://youtu.be/Ty9fOfLkx1E?si=o9eUg9BBpKS_MaeS",
    "https://youtu.be/nWeltuo-u9U?si=Aj0n5Ew5gyBhFBLN",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
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
          "Python 2024",
          style: GoogleFonts.montserrat(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 4, spreadRadius: 2, color: Colors.black26)
                ],
                color: Colors.white,
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                "https://mucertification.com/wp-content/uploads/2021/07/Python-Image-Basic-and-Advanced-Level.png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Text(
                    "Python 2024",
                    style: GoogleFonts.abhayaLibre(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "${videoURL.length} Lectures",
                    style: GoogleFonts.abhayaLibre(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(90)),
                ),
                child: ListView.builder(
                  itemCount: videoURL.length,
                  itemBuilder: (context, index) {
                    final videoId =
                        YoutubePlayer.convertUrlToId(videoURL[index]);

                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => pyvideos(videoId: videoId),
                        ));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: const LinearGradient(
                            colors: [Colors.white, Color(0xFFD1E3FF)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                                offset: Offset(5, 6)),
                          ],
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.network(
                                    YoutubePlayer.getThumbnail(
                                        videoId: videoId!),
                                    height: 90,
                                    width: 140,
                                    fit: BoxFit.cover,
                                  ),
                                  const Icon(Icons.play_circle_fill,
                                      size: 45, color: Colors.white),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Text(
                                "Lectures: ${index + 1}",
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
