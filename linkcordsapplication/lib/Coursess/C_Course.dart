import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkcordsapplication/Coursess/cVideopage.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class C_Course extends StatefulWidget {
  const C_Course({super.key});

  @override
  State<C_Course> createState() => _UploadPageState();
}

class _UploadPageState extends State<C_Course> {
  List<String> videoURL = [
    "https://youtu.be/r96id26vnqk?si=qiJHnYT6HZjsOobd",
    "https://youtu.be/goo8bnt53iw?si=DMNNDMyNn_pI3HrO",
    "https://youtu.be/rYJqOs-JMPE?si=xQQGiC-fTlXJKxXx",
    "https://youtu.be/HlwzbsvfmDA?si=88tgUJv-FqU3cj1h",
    "https://youtu.be/d9PdC_YtzlM?si=7_VEOc9Am-pWSp0X",
    "https://youtu.be/Mjr2QiegzzE?si=Z0DDiKyqWLg31nxx",
    "https://youtu.be/i0EznnIqpvM?si=0ZBaeBnyY_B4EuhS",
    "https://youtu.be/o970MRqjGMU?si=Z8DSkjGUrLGkUupf",
    "https://youtu.be/Xi6f_9mG3ZM?si=8MJV54zZHLxKIFGy",
    "https://youtu.be/R56vgxs5kxQ?si=_77sYkt6OA3axU9M",
    "https://youtu.be/JxM1zfDu8LM?si=Pc7B-ko4lkXALnRO",
    "https://youtu.be/iTy4FM52YBc?si=6my9tIKbCm4lKG7R",
    "https://youtu.be/yuapDs03FGQ?si=8xCdb0y-RlIVznXb",
    "https://youtu.be/BMIe0A7Gngk?si=FkaQEEzSxuhtXvp2",
  ];

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
          "C, C++ 2024",
          style: GoogleFonts.montserrat(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF1F9FF), Color(0xFFD0E7FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Container(
              height: 210,
              width: 420,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(2, 4))
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                "https://nctaindia.in/images/course/cc.jpeg",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "C, C++ 2024",
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "${videoURL.length} videos",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(90)),
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: videoURL.length,
                  itemBuilder: (BuildContext context, int index) {
                    final videoId =
                        YoutubePlayer.convertUrlToId(videoURL[index]);
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Cvideopage(videoId: videoId),
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
            ),
          ],
        ),
      ),
    );
  }
}
