// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart'; // ✅ Add this in pubspec.yaml

// import 'creat_profil_modal.dart';

// class ConnectiosPage extends StatefulWidget {
//   final String userEmail;

//   const ConnectiosPage({super.key, required this.userEmail});

//   @override
//   State<ConnectiosPage> createState() => _ConnectiosPageState();
// }

// class _ConnectiosPageState extends State<ConnectiosPage> {
//   CreatProfilModal? userProfile;
//   List<CreatProfilModal> connectionsList = [];

//   @override
//   void initState() {
//     super.initState();
//     loadUserProfile();
//   }

//   Future<void> loadUserProfile() async {
//     try {
//       final userDoc = await FirebaseFirestore.instance
//           .collection("userInfo")
//           .doc(widget.userEmail)
//           .get();

//       if (!userDoc.exists) return;

//       final userData = userDoc.data()!;

//       userProfile = CreatProfilModal(
//         email: userData['userEmailid'],
//         usreName: userData['UserName'],
//         bio: userData['bio'],
//         location: userData['location'],
//         profilPic: userData['profilepic'],
//         connections: List<String>.from(userData['connections'] ?? []),
//       );

//       log("Connections: ${userProfile!.connections}");

//       connectionsList.clear();

//       for (String email in userProfile!.connections) {
//         final connDoc = await FirebaseFirestore.instance
//             .collection("userInfo")
//             .doc(email)
//             .get();
//         if (connDoc.exists) {
//           final connData = connDoc.data()!;
//           connectionsList.add(
//             CreatProfilModal(
//               email: connData['userEmailid'],
//               usreName: connData['UserName'],
//               bio: connData['bio'],
//               location: connData['location'],
//               profilPic: connData['profilepic'],
//               connections: List<String>.from(connData['connections'] ?? []),
//             ),
//           );
//         }
//       }

//       setState(() {});
//     } catch (e) {
//       log("Error: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//       appBar: AppBar(
//         title: const Text("Profile"),
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 0.5,
//       ),
//       body: userProfile == null
//           ? const Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               child: Column(
//                 children: [
//                   const SizedBox(height: 20),
//                   CircleAvatar(
//                     radius: 50,
//                     backgroundColor: Colors.grey.shade300,
//                     child: ClipOval(
//                       child: CachedNetworkImage(
//                         imageUrl: userProfile!.profilPic ?? "",
//                         placeholder: (context, url) =>
//                             const CircularProgressIndicator(),
//                         errorWidget: (context, url, error) =>
//                             const Icon(Icons.person, size: 50),
//                         fit: BoxFit.cover,
//                         width: 100,
//                         height: 100,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     userProfile!.usreName ?? "",
//                     style: const TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 6),
//                   Text(
//                     userProfile!.bio ?? "",
//                     style: TextStyle(
//                       color: Colors.grey.shade700,
//                       fontSize: 14,
//                     ),
//                   ),
//                   Text(
//                     userProfile!.location ?? "",
//                     style: TextStyle(
//                       color: Colors.grey.shade600,
//                       fontSize: 13,
//                     ),
//                   ),
//                   const SizedBox(height: 25),
//                   Divider(
//                     color: Colors.grey.shade300,
//                     thickness: 1,
//                     indent: 30,
//                     endIndent: 30,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 20, vertical: 16),
//                     child: Row(
//                       children: [
//                         const Text(
//                           "Connections",
//                           style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black87),
//                         ),
//                         const Spacer(),
//                         Text(
//                           "${connectionsList.length} connected",
//                           style: TextStyle(
//                             color: Colors.grey.shade700,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   // ✅ Modern Grid of connections
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: GridView.builder(
//                       physics: const NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount: connectionsList.length,
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 3,
//                         crossAxisSpacing: 16,
//                         mainAxisSpacing: 16,
//                       ),
//                       itemBuilder: (context, index) {
//                         final conn = connectionsList[index];
//                         return Column(
//                           children: [
//                             ClipOval(
//                               child: CachedNetworkImage(
//                                 imageUrl: conn.profilPic ?? "",
//                                 imageBuilder: (context, imageProvider) =>
//                                     Container(
//                                   width: 70,
//                                   height: 70,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     image: DecorationImage(
//                                       image: imageProvider,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                                 placeholder: (context, url) => Container(
//                                   width: 70,
//                                   height: 70,
//                                   alignment: Alignment.center,
//                                   decoration: const BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: Colors.white,
//                                   ),
//                                   child: const SizedBox(
//                                       width: 24,
//                                       height: 24,
//                                       child: CircularProgressIndicator(
//                                           strokeWidth: 2)),
//                                 ),
//                                 errorWidget: (context, url, error) =>
//                                     const Icon(Icons.person),
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               conn.usreName ?? "",
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: const TextStyle(
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         );
//                       },
//                     ),
//                   ),

//                   const SizedBox(height: 30),
//                 ],
//               ),
//             ),
//     );
//   }
// }

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'creat_profil_modal.dart';
import 'profile1.dart'; // Your user profile page

class ConnectiosPage extends StatefulWidget {
  final String userEmail;

  const ConnectiosPage({super.key, required this.userEmail});

  @override
  State<ConnectiosPage> createState() => _ConnectiosPageState();
}

class _ConnectiosPageState extends State<ConnectiosPage> {
  CreatProfilModal? userProfile;
  List<CreatProfilModal> connectionsList = [];

  @override
  void initState() {
    super.initState();
    loadUserProfile();
  }

  Future<void> loadUserProfile() async {
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection("userInfo")
          .doc(widget.userEmail)
          .get();

      if (!userDoc.exists) return;

      final userData = userDoc.data()!;

      userProfile = CreatProfilModal(
        email: userData['userEmailid'],
        usreName: userData['UserName'],
        bio: userData['bio'],
        location: userData['location'],
        profilPic: userData['profilepic'],
        connections: List<String>.from(userData['connections'] ?? []),
      );

      connectionsList.clear();

      for (String email in userProfile!.connections) {
        final connDoc = await FirebaseFirestore.instance
            .collection("userInfo")
            .doc(email)
            .get();
        if (connDoc.exists) {
          final connData = connDoc.data()!;
          connectionsList.add(
            CreatProfilModal(
              email: connData['userEmailid'],
              usreName: connData['UserName'],
              bio: connData['bio'],
              location: connData['location'],
              profilPic: connData['profilepic'],
              connections: List<String>.from(connData['connections'] ?? []),
            ),
          );
        }
      }

      setState(() {});
    } catch (e) {
      log("Error: $e");
    }
  }

  Future<void> removeConnection(String connectionEmail) async {
    try {
      if (userProfile == null) return;

      // Remove connection email from local connections list
      userProfile!.connections.remove(connectionEmail);

      // Update Firestore
      await FirebaseFirestore.instance
          .collection("userInfo")
          .doc(widget.userEmail)
          .update({
        "connections": userProfile!.connections,
      });

      // Reload connections list
      await loadUserProfile();
    } catch (e) {
      log("Error removing connection: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          "My Connections",
          style: GoogleFonts.montserrat(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: userProfile == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      userProfile!.profilPic != ""
                          ? userProfile!.profilPic!
                          : "https://static.vecteezy.com/system/resources/thumbnails/005/544/718/small_2x/profile-icon-design-free-vector.jpg",
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    userProfile!.usreName ?? "",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    userProfile!.bio ?? "",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    userProfile!.location ?? "",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 30),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const Text(
                          "Connections",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Text(
                          "${connectionsList.length} connected",
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),

                  /// ✅ Grid of Connections with remove button
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: connectionsList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      final conn = connectionsList[index];
                      return GestureDetector(
                        onTap: () {
                          log("On Tap User:- ${conn.email}");
                          log("On Tap User:- ${conn.usreName}");
                          log("On Tap User:- ${conn.location}");
                          log("On Tap User:- ${conn.connections}");
                          log("On Tap User:- ${conn.bio}");

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => Profile1(
                                userEmail: conn.email!,
                                username: conn.usreName!,
                                userbio: conn.bio!,
                                userLocation: conn.location!,
                                userURl: conn.profilPic!,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 18, left: 18, right: 18, bottom: 5),
                                  child: ClipOval(
                                    child: FadeInImage.assetNetwork(
                                      placeholder: "assets/loading.gif",
                                      image: conn.profilPic != ""
                                          ? conn.profilPic!
                                          : "https://static.vecteezy.com/system/resources/thumbnails/005/544/718/small_2x/profile-icon-design-free-vector.jpg",
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: -8,
                                  top: -8,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.cancel,
                                      color: Colors.redAccent,
                                      size: 20,
                                    ),
                                    onPressed: () async {
                                      await removeConnection(conn.email!);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(
                              conn.usreName ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
    );
  }
}
