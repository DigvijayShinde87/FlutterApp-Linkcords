import 'dart:developer';

// ignore: depend_on_referenced_packages
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:linkcordsapplication/Bot/chatApppage.dart';
import 'package:linkcordsapplication/Coursess/search.dart';
import 'package:linkcordsapplication/HomePage/home_page.dart';
import 'package:linkcordsapplication/JOBportal/internshippage.dart';
import 'package:linkcordsapplication/ProfilePage/explore.dart';
import 'package:linkcordsapplication/chatApp/UserListPage.dart';
import 'package:linkcordsapplication/GameHub/game_hub.dart';
import 'package:linkcordsapplication/Coursess/JavaCourse.dart';
// ignore: depend_on_referenced_packages
import 'package:page_transition/page_transition.dart';
import 'package:linkcordsapplication/profilePage/profile1.dart';

class RootPage extends StatefulWidget {
  final String email;
  final String picUR;
  final String username;
  final String bio;
  final String location;

  const RootPage({
    super.key,
    required this.bio,
    required this.location,
    required this.email,
    required this.picUR,
    required this.username,
  });

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  static String username = '';
  static String userPhoto = '';

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    username = widget.username;
    log('userName: $username');
    userPhoto = widget.picUR;
    log('userphoto: $userPhoto');
  }

  int _bottomNavigationindex = 0;
  Color bgColor = Colors.blue;

  List<Widget> pages = [];

  final List<Widget> _IconList = [
    const Icon(Icons.home),
    const Icon(Icons.search),
    const Icon(Icons.sports_esports),
    const Icon(Icons.psychology),
    const Icon(Icons.mode_comment_outlined),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    pages = [
      HomeScreen(currentUserName: username),
      const ExplorePage(),
      const GameHub(),
      const Myskillui(),
      UserListPage(currentUserId: username),
      const Javacourse(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // ✅ enable manual Drawer open
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false, // ✅ remove default hamburger
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
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
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Row(
            children: [
              // ✅ Profile photo as Drawer toggle
              GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                    widget.picUR.isNotEmpty
                        ? widget.picUR
                        : "https://static.vecteezy.com/system/resources/thumbnails/005/544/718/small_2x/profile-icon-design-free-vector.jpg",
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // ✅ Username & email
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.username,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    widget.email,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
              const Spacer(),

              // ✅ Chat icon
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: const Chatapppage(),
                      type: PageTransitionType.leftToRightWithFade,
                      duration: const Duration(milliseconds: 300),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 6,
                        offset: const Offset(2, 4),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.mark_unread_chat_alt_rounded,
                    color: Colors.black87,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // ✅ LinkedIn-style Drawer:
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      widget.picUR.isNotEmpty
                          ? widget.picUR
                          : "https://static.vecteezy.com/system/resources/thumbnails/005/544/718/small_2x/profile-icon-design-free-vector.jpg",
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.username,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          widget.email,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: Profile1(
                      userEmail: widget.email,
                      userLocation: widget.location,
                      userURl: widget.picUR,
                      userbio: widget.bio,
                      username: widget.username,
                    ),
                    type: PageTransitionType.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 200),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.work),
              title: const Text("Job Opportunity.."),
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const InternshipPage(),
                    type: PageTransitionType.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 200),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                // Add logout logic here
              },
            ),
          ],
        ),
      ),

      body: IndexedStack(
        index: _bottomNavigationindex,
        children: pages,
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 36, 85, 140),
        color: const Color.fromARGB(255, 188, 212, 249),
        items: _IconList,
        animationDuration: const Duration(milliseconds: 200),
        onTap: (index) {
          setState(() {
            _bottomNavigationindex = index;
          });
        },
      ),
    );
  }
}
