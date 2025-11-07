import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkcordsapplication/Coursess/webVideos.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Webcourse extends StatefulWidget {
  const Webcourse({super.key});

  @override
  State<Webcourse> createState() => _UploadPageState();
}

class _UploadPageState extends State<Webcourse> {
  List<String> videoURL = [
    "https://youtu.be/HcOc7P5BMi4?si=Bjurj4qKGxmHL0iX",
    "https://youtu.be/ESnrn1kAD4E?si=TU2fThRI5CETRjL6",
    "https://youtu.be/ajdRvxDWH4w?si=cZ_E1ha4y5taQ_Xz",
    "https://youtu.be/Zg4-uSjxosE?si=PVASDmn9Ry-QQCrI",
    "https://youtu.be/gFWhbjzowrM?si=5wJ0sC2aeZe6ryMQ",
    "https://youtu.be/gFWhbjzowrM?si=RLAoPb_hq_3pGeMs",
    "https://youtu.be/P0XMXqDGttU?si=MsoyIEAtpZcry_Ew",
    "https://youtu.be/7zcXPCt8Ck0?si=SRrFwAhJnM7IDRBx",
    "https://youtu.be/fXAGTOZ25H8?si=fZ3KfPeg8v6lckaO",
    "https://youtu.be/_i-uLJAh79U?si=YvOEnukFX62SeZHH",
    "https://youtu.be/SqrppLEljkY?si=_RrVoeFZOJd7UJsW",
    "https://youtu.be/_V33HCZWLDQ?si=umjdPYC9eWY_KNL2",
    "https://youtu.be/N-O4w6PynGY?si=IdzxUEaKvvM31LuL",
    "https://youtu.be/d3jXofmQm44?si=pxlQc7ilKRGBppw0",
    "https://youtu.be/CyGodpqcid4?si=jujwcCDgKsSOUy60",
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
          "Web-Dev 2024",
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
                "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20200214165928/Web-Development-Course-Thumbnail.jpg",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Text(
                    "Web-Dev 2024",
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: const BoxDecoration(),
                child: ListView.builder(
                  itemCount: videoURL.length,
                  itemBuilder: (BuildContext context, int index) {
                    final videoId =
                        YoutubePlayer.convertUrlToId(videoURL[index]);

                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Webvideos(videoId: videoId),
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
                                "Video: ${index + 1}",
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
