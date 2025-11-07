import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linkcordsapplication/ProfilePage/creat_profil_modal.dart';

// Dummy Color palette for light theme
class AppColors {
  static const Color primary = Color(0xFF0077B5); // LinkedIn blue
  static const Color bgColor = Color(0xFFF6F9FC);
  static const Color cardColor = Colors.white;
  static const Color textPrimary = Color(0xFF2C3E50);
  static const Color textSecondary = Color(0xFF7F8C8D);
  static const Color buttonColor = Color(0xFF0077B5);
  static const Color connectedColor = Colors.grey;
}

List<CreatProfilModal> networkList = [];
List<CreatProfilModal> filteredList = [];

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? myEmail;
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    myEmail = _auth.currentUser!.email!;
    _loadNetwork();
  }

  Future<void> _loadNetwork() async {
    networkList.clear();
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection("userInfo").get();

    for (var doc in snapshot.docs) {
      if (doc['userEmailid'] != myEmail) {
        networkList.add(
          CreatProfilModal(
            usreName: doc['UserName'],
            email: doc['userEmailid'],
            bio: doc['bio'],
            location: doc['location'],
            profilPic: doc['profilepic'],
            connections: List<String>.from(doc['connections']),
          ),
        );
      }
    }
    setState(() {
      filteredList = networkList;
    });
  }

  Future<void> connectUser(String otherEmail) async {
    final myDoc =
        FirebaseFirestore.instance.collection('userInfo').doc(myEmail);
    final otherDoc =
        FirebaseFirestore.instance.collection('userInfo').doc(otherEmail);

    final myData = await myDoc.get();
    final otherData = await otherDoc.get();

    List myConnections = myData['connections'] ?? [];
    List otherConnections = otherData['connections'] ?? [];

    if (!myConnections.contains(otherEmail)) {
      myConnections.add(otherEmail);
    }
    if (!otherConnections.contains(myEmail)) {
      otherConnections.add(myEmail);
    }

    await myDoc.update({'connections': myConnections});
    await otherDoc.update({'connections': otherConnections});

    log('✅ Connected $myEmail <--> $otherEmail');
    await _loadNetwork();
  }

  // Padding(
  //                       padding: const EdgeInsets.all(15.0),
  //                       child: Stack(
  //                         children: [
  //                           Container(
  //                             decoration: const BoxDecoration(
  //                               boxShadow: [
  //                                 BoxShadow(
  //                                     blurRadius: 2,
  //                                     spreadRadius: 2,
  //                                     color: Colors.black)
  //                               ],
  //                               color: Colors.white,
  //                             ),
  //                             // color: Colors.white,
  //                             child: Column(
  //                               children: [
  //                                 Container(
  //                                   width: double.infinity,
  //                                   height: 100,
  //                                   decoration: const BoxDecoration(
  //                                     gradient: LinearGradient(
  //                                         begin: Alignment.topLeft,
  //                                         end: Alignment.bottomRight,
  //                                         colors: [
  //                                           Color.fromARGB(255, 129, 128, 128),
  //                                           Colors.white,
  //                                         ]),
  //                                   ),
  //                                 ),
  //                                 const SizedBox(
  //                                   height: 60,
  //                                 ),
  //                                 Padding(
  //                                   padding: const EdgeInsets.symmetric(
  //                                       horizontal: 8.0),
  //                                   child: Text(
  //                                     networkList[index].usreName!,
  //                                     maxLines: 1,
  //                                     overflow: TextOverflow.ellipsis,
  //                                     style: const TextStyle(
  //                                         fontSize: 18,
  //                                         fontWeight: FontWeight.bold),
  //                                   ),
  //                                 ),
  //                                 Padding(
  //                                   padding: const EdgeInsets.symmetric(
  //                                       horizontal: 8.0),
  //                                   child: Text(
  //                                     networkList[index].email!,
  //                                     maxLines: 1,
  //                                     overflow: TextOverflow.ellipsis,
  //                                     style: const TextStyle(
  //                                         fontSize: 15,
  //                                         fontWeight: FontWeight.w500,
  //                                         color: Color.fromRGBO(86, 86, 91, 1)),
  //                                   ),
  //                                 ),
  //                                 const SizedBox(
  //                                   height: 5,
  //                                 ),
  //                                 Padding(
  //                                   padding: const EdgeInsets.symmetric(
  //                                       horizontal: 8.0),
  //                                   child: Text(
  //                                     networkList[index].bio!,
  //                                     maxLines: 1,
  //                                     overflow: TextOverflow.ellipsis,
  //                                     style: const TextStyle(
  //                                         fontSize: 15,
  //                                         fontWeight: FontWeight.w500,
  //                                         color: Color.fromRGBO(86, 86, 91, 1)),
  //                                   ),
  //                                 ),
  //                                 const SizedBox(
  //                                   height: 10,
  //                                 ),
  //                                 Row(
  //                                   children: [
  //                                     const SizedBox(
  //                                       width: 145,
  //                                     ),
  //                                     const CircleAvatar(
  //                                       radius: 14,
  //                                       child: Icon(Icons.location_on),
  //                                     ),
  //                                     const SizedBox(
  //                                       width: 10,
  //                                     ),
  //                                     Expanded(
  //                                       child: Text(
  //                                         networkList[index].location,
  //                                         style: TextStyle(
  //                                           fontSize: 15,
  //                                           fontWeight: FontWeight.w300,
  //                                           color: AppColors.darkGrey,
  //                                         ),
  //                                         maxLines: 2,
  //                                         overflow: TextOverflow.ellipsis,
  //                                       ),
  //                                     ),
  //                                   ],
  //                                 ),
  //                                 const SizedBox(
  //                                   height: 20,
  //                                 ),
  //                                 OutlinedButton(
  //                                     onPressed: () async {
  //                                       log("----------in connect-----------");
  //                                       FirebaseAuth
  //                                           .instance.currentUser!.email;

  //                                       log("hello${FirebaseAuth.instance.currentUser!.email}");

  //                                       // log("${networkList[index].bio!}");

  //                                       DocumentSnapshot<Map<String, dynamic>>
  //                                           myData = await FirebaseFirestore
  //                                               .instance
  //                                               .collection("userInfo")
  //                                               .doc(FirebaseAuth.instance
  //                                                   .currentUser!.email)
  //                                               .get();

  //                                       log("${myData.data()!['bio']}");

  //                                       CreatProfilModal myProfileObj =
  //                                           CreatProfilModal(
  //                                         bio: myData.data()!['bio'],
  //                                         connections:
  //                                             myData.data()!['connections'],
  //                                         email: myData.data()!['userEmailid'],
  //                                         location: myData.data()!['location'],
  //                                         profilPic:
  //                                             myData.data()!['profilepic'],
  //                                         usreName: myData.data()!['UserName'],
  //                                       );

  //                                       await FirebaseFirestore.instance
  //                                           .collection("userInfo")
  //                                           .doc(FirebaseAuth
  //                                               .instance.currentUser!.email)
  //                                           .update(
  //                                             CreatProfilModal.toMapData(
  //                                               myProfileObj,
  //                                               // networkList[index].email,
  //                                               networkList[index].usreName!,
  //                                             ),
  //                                           );
  //                                       setState(() {});
  //                                     },
  //                                     child: const Text("Connect")),
  //                                 const SizedBox(
  //                                   height: 10,
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           Align(
  //                             alignment: Alignment.topCenter,
  //                             child: Container(
  //                               margin: const EdgeInsets.only(top: 20),
  //                               width: 110,
  //                               height: 110,
  //                               decoration: const BoxDecoration(
  //                                   color: Color.fromRGBO(86, 86, 91, 1),
  //                                   shape: BoxShape.circle),
  //                               child: ClipRRect(
  //                                 borderRadius: BorderRadius.circular(60),
  //                                 child: (networkList[index].profilPic == null)
  //                                     ? Image.network(
  //                                         "https://static.vecteezy.com/system/resources/thumbnails/005/544/718/small_2x/profile-icon-design-free-vector.jpg",
  //                                         width: 70,
  //                                         height: 70,
  //                                         fit: BoxFit.cover,
  //                                       )
  //                                     : Image.network(
  //                                         (networkList[index].profilPic),
  //                                         width: 60,
  //                                         height: 60,
  //                                         fit: BoxFit.cover,
  //                                       ),
  //                               ),
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                     );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: RefreshIndicator(
        onRefresh: _loadNetwork,
        child: Column(
          children: [
            // ✅ Search bar
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                  ),
                ],
              ),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Search by name...",
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value.toLowerCase();
                    filteredList = networkList
                        .where((user) =>
                            user.usreName!.toLowerCase().contains(searchQuery))
                        .toList();
                  });
                },
              ),
            ),

            // ✅ User cards
            Expanded(
              child: filteredList.isEmpty
                  ? const Center(
                      child: Text(
                        "No people found...",
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 16,
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        final user = filteredList[index];
                        final connected = user.connections.contains(myEmail);

                        return Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            color: AppColors.cardColor,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 70,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(16)),
                                      // gradient: LinearGradient(
                                      //   colors: [
                                      //     AppColors.primary.withOpacity(0.7),
                                      //     AppColors.primary.withOpacity(0.5),
                                      //   ],
                                      //   begin: Alignment.topLeft,
                                      //   end: Alignment.bottomRight,
                                      // ),
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(
                                                0xFFB2D8FF), // Color.fromARGB(255, 129, 128, 128),
                                            Colors.white,
                                          ]),
                                    ),
                                  ),
                                  const SizedBox(height: 50),
                                  Text(
                                    user.usreName ?? "",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 4),
                                    child: Text(
                                      user.bio ?? "",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    user.location ?? "",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: connected
                                          ? AppColors.connectedColor
                                          : const Color(0xFFB2D8FF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 10),
                                    ),
                                    onPressed: connected
                                        ? null
                                        : () {
                                            connectUser(user.email!);
                                          },
                                    child: Text(
                                      connected ? "Connected" : "Connect",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                ],
                              ),
                              Positioned(
                                top: 30,
                                left:
                                    MediaQuery.of(context).size.width / 2 - 60,
                                child: CircleAvatar(
                                  radius: 45,
                                  backgroundColor: Colors.white,
                                  child: ClipOval(
                                    child: FadeInImage.assetNetwork(
                                      placeholder: "assets/loading.gif",
                                      image: user.profilPic != ""
                                          ? user.profilPic!
                                          : "https://static.vecteezy.com/system/resources/thumbnails/005/544/718/small_2x/profile-icon-design-free-vector.jpg",
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
