import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkcordsapplication/Coursess/javaVideoPage.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Javacourse extends StatefulWidget {
  const Javacourse({super.key});

  @override
  State<Javacourse> createState() => _UploadPageState();
}

class _UploadPageState extends State<Javacourse> {
  List<String> videoURL = [
    "https://youtu.be/yRpLlJmRo2w?si=YOfhdpTMf8eZMTYk",
    "https://youtu.be/LusTv0RlnSU?si=CBkBh1Dnpgs51MNY",
    "https://youtu.be/I5srDu75h_M?si=azZGjbU3MCNvJLL3",
    "https://youtu.be/0r1SfRoLuzU?si=Q4VK4k4olVC5-Lz-",
    "https://youtu.be/GjHNGM7KN3w?si=AbELgN3mpaxBno6P",
    "https://youtu.be/Dr4PpNa7AYo?si=dA0QCAj5_J5f5hiK",
    "https://youtu.be/qcSz4ef9UHA?si=-kCqhPKjE69qO4o5",
    "https://youtu.be/pFPZ83mgH00?si=N5QyK0WbZXVa9Mcp",
    "https://youtu.be/bQssdSrSGNE?si=xCPXPgqi5SQcHXsZ",
    "https://youtu.be/NTHVTY6w2Co?si=Nt7ujFZcpaK8WpxV",
    "https://youtu.be/18Zt5I4S45o?si=DKOzyrGzZd-8KscW",
    "https://youtu.be/vCRD36bG8xQ?si=TZQiHIwD6SDADCCr",
    "https://youtu.be/ZLDwskEhIFg?si=-ZQlSnlOA4t2f-3d",
    "https://youtu.be/Oud4alVQU4s?si=2U7wRFRPHYwcxAzV",
    "https://youtu.be/OSoO8eCEEC8?si=mQ9VdIp0tPSH7sUD",
    "https://youtu.be/PkJIc5tBRUE?si=s-JZDfFmmIZZeyWg",
    "https://youtu.be/liFyhzZl9uw?si=L5vrScBtB3TJOa_c",
  ];

  int index = 0;
  late YoutubePlayerController _controller;
  bool istrue = true;

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
          "Java Programming 2024",
          style: GoogleFonts.montserrat(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.blue.shade50,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),

            // Banner
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  "https://www.itbrainy.com/wp-content/uploads/2020/07/large.png",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Course Title & Video Count
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Text(
                    "Java Programming 2024",
                    style: GoogleFonts.ubuntu(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${videoURL.length} videos",
                    style: GoogleFonts.ubuntu(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Video List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: videoURL.length,
                itemBuilder: (context, index) {
                  final videoId = YoutubePlayer.convertUrlToId(videoURL[index]);
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Javavideopage(videoId: videoId),
                        ),
                      );
                    },
                    child: Container(
                      height: 125,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          // Thumbnail
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.network(
                                  YoutubePlayer.getThumbnail(videoId: videoId!),
                                  width: 170,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                const Icon(
                                  Icons.play_circle_fill,
                                  color: Colors.white,
                                  size: 36,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          // Video title
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              child: Text(
                                "Lecture ${index + 1}",
                                style: GoogleFonts.ubuntu(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
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
          ],
        ),
      ),
    );
  }
}
