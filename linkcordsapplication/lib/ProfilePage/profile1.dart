import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkcordsapplication/Login_PagesCode/LoginPageUI.dart';
import 'package:linkcordsapplication/Login_PagesCode/SessionData.dart';
import 'package:linkcordsapplication/ProfilePage/connectios.dart';
import 'package:linkcordsapplication/ProfilePage/creat_post.dart';
import 'package:linkcordsapplication/ProfilePage/creat_profil_modal.dart';
import 'package:linkcordsapplication/ProfilePage/photoView.dart';
import 'package:nb_utils/nb_utils.dart';

List<CreatProfilModal> networkList = [];
List<dynamic> posts = [];
Map<String, dynamic> postData = {};
bool isLoading = true;

class Profile1 extends StatefulWidget {
  final String username;
  final String userEmail;
  final String userURl;
  final String userbio;
  final String userLocation;

  const Profile1({
    super.key,
    required this.username,
    required this.userEmail,
    required this.userLocation,
    required this.userURl,
    required this.userbio,
  });

  @override
  State<Profile1> createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
  void fetchPosts() async {
    setState(() {
      isLoading = true;
    });

    // Simulate delay (replace this with your actual fetch logic)
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
  }

  Future<void> getNetworkData() async {
    log('in getnetworkData funtion');
    networkList.clear();
    posts.clear();
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection("userInfo").get();

    for (int i = 0; i < response.docs.length; i++) {
      networkList.add(CreatProfilModal(
        usreName: response.docs[i]['UserName'],
        email: response.docs[i]['userEmailid'],
        bio: response.docs[i]['bio'],
        location: response.docs[i]['location'],
        profilPic: response.docs[i]['profilepic'],
        connections: response.docs[i]['connections'],
      ));
    }

    dynamic currentUser = await FirebaseFirestore.instance
        .collection('userInfo')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get();
    log("currentUserName: $currentUser");
    log("currentUserName: ${currentUser['UserName']}");

    QuerySnapshot postResponce =
        await FirebaseFirestore.instance.collection('Postdata').get();

    for (int i = 0; i < postResponce.docs.length; i++) {
      if (postResponce.docs[i]['name'] == widget.username) {
        postData = {
          'PostPic': postResponce.docs[i]['postepic'],
          'profilePic': postResponce.docs[i]['pic'],
          'Description': postResponce.docs[i]['Description'],
          'likes': postResponce.docs[i]['likes'],
          'name': postResponce.docs[i]['name'],
        };
        posts.add(postData);
      }
    }

    log('posts: ${posts.length}');
  }

  @override
  void initState() {
    super.initState();
    getNetworkData();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF3F6),
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
            borderRadius: BorderRadius.only(
                // bottomLeft: Radius.circular(20),
                // bottomRight: Radius.circular(20),
                ),
          ),
        ),
        title: Text(
          "My Profile",
          style: GoogleFonts.montserrat(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black),
            onPressed: () async {
              SessionData.isLogin = false;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreenUI()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  widget.userURl.isNotEmpty
                      ? widget.userURl
                      : "https://static.vecteezy.com/system/resources/thumbnails/005/544/718/small_2x/profile-icon-design-free-vector.jpg",
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.username,
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            Text(
              widget.userEmail,
              style: GoogleFonts.poppins(color: Colors.grey[700]),
            ),
            const SizedBox(height: 6),
            Text(
              widget.userbio,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_pin,
                    size: 18, color: Colors.blueGrey),
                Text(
                  widget.userLocation,
                  style:
                      GoogleFonts.poppins(fontSize: 14, color: Colors.blueGrey),
                ),
              ],
            ),
            const SizedBox(height: 30),

            /// Connections and Create Post
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildProfileAction(
                  icon: Icons.group,
                  label: "Connections",
                  // "${networkList.where((x) => x.usreName == widget.username).isNotEmpty ? networkList.firstWhere((x) => x.usreName == widget.username).connections.length : 0} Connections",
                  onTap: () async {
                    await getNetworkData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            ConnectiosPage(userEmail: widget.userEmail),
                      ),
                    );
                  },
                ),
                _buildProfileAction(
                  icon: Icons.add_circle_outline,
                  label: "Create Post",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CreatPost(
                          Username: widget.username,
                          profilPic: widget.userURl,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            Container(
                padding: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFB2D8FF),
                      Color(0xFFD9EFFF),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: buildUserPostsGrid()),
          ],
        ),
      ),
    );
  }

  Widget buildUserPostsGrid() {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: posts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 010,
            ),
            itemBuilder: (context, index) {
              return ClipRRect(
                // borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  child: ClipOval(
                    child: FadeInImage.assetNetwork(
                      placeholder: "assets/loading.gif",
                      image: posts[index]['PostPic'] != ""
                          ? posts[index]['PostPic']
                          : "https://static.vecteezy.com/system/resources/thumbnails/005/544/718/small_2x/profile-icon-design-free-vector.jpg",
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PostDetailPage(post: posts[index]),
                      ),
                    );
                  },
                ),
              );
            },
          );
  }

  Widget _buildProfileAction({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(2, 2),
            )
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 28, color: Colors.blueAccent),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
