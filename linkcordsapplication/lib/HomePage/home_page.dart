// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:linkcordsapplication/HomePage/commentButton.dart';
// import 'package:linkcordsapplication/NavigatorPages/CurrentUser.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:http/http.dart' as http;

// class LocalPost {
//   final String id;
//   final String name;
//   final String description;
//   final String imagePath;

//   LocalPost({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.imagePath,
//   });

//   // Convert LocalPost object to a map for SQLite storage
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'description': description,
//       'imagePath': imagePath,
//     };
//   }

//   // Convert a map back to LocalPost object
//   factory LocalPost.fromMap(Map<String, dynamic> map) {
//     return LocalPost(
//       id: map['id'],
//       name: map['name'],
//       description: map['description'],
//       imagePath: map['imagePath'],
//     );
//   }
// }

// // Database helper class for interacting with SQLite
// class PostDatabase {
//   static Database? _db;

//   // Initialize the SQLite database
//   Future<Database> get db async {
//     return _db ??= await initDb();
//   }

//   // Create the database and tables
//   Future<Database> initDb() async {
//     final dir = await getApplicationDocumentsDirectory();
//     final path = join(dir.path, 'posts.db');
//     return await openDatabase(path, version: 1, onCreate: (db, version) async {
//       await db.execute('''
//         CREATE TABLE posts (
//           id TEXT PRIMARY KEY,
//           name TEXT,
//           description TEXT,
//           imagePath TEXT
//         )
//       ''');
//     });
//   }

//   // Insert a post into the database
//   Future<void> insertPost(LocalPost post) async {
//     final dbClient = await db;
//     await dbClient.insert('posts', post.toMap(),
//         conflictAlgorithm: ConflictAlgorithm.replace);
//   }

//   // Fetch all posts from the database
//   Future<List<LocalPost>> getAllPosts() async {
//     final dbClient = await db;
//     final maps = await dbClient.query('posts');
//     return maps.map((map) => LocalPost.fromMap(map)).toList();
//   }
// }

// // ignore: must_be_immutable
// class HomeScreen extends StatefulWidget {
//   dynamic currentUserName;
//   // dynamic currentuserPhoto;
//   HomeScreen({
//     super.key,
//     required this.currentUserName,
//     // required this.currentuserPhoto
//   });

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late Future<List<Currentuserpost>> postFuture;
//   Future<List<LocalPost>>? _postsFuture;

//   @override
//   void initState() {
//     super.initState();
//     postFuture = getNetworkData();
//     log('widget.currentUserName${widget.currentUserName}');
//     _postsFuture = PostDatabase().getAllPosts();
//     // log('widget.currentuserPhoto${widget.currentuserPhoto}');
//   }

//   Future<String> downloadAndSaveImage(String imageUrl, String fileName) async {
//     final response = await http.get(Uri.parse(imageUrl));
//     final dir = await getApplicationDocumentsDirectory();
//     final imagePath = join(dir.path, '$fileName.jpg');
//     final file = File(imagePath);
//     await file.writeAsBytes(response.bodyBytes);
//     return imagePath;
//   }

//   Future<List<Currentuserpost>> getNetworkData() async {
//     List<Currentuserpost> postList = [];

//     log("Fetching post data...");
//     QuerySnapshot response =
//         await FirebaseFirestore.instance.collection("Postdata").get();
//     log("Data fetched");

//     for (var doc in response.docs) {
//       postList.add(
//         Currentuserpost(
//           Description: doc["Description"],
//           name: doc['name'],
//           pic: doc['pic'],
//           profilPic: doc['postepic'],
//           postId: doc.id,
//         ),
//       );
//     }

//     return postList;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF2F2F7), // Light Instagram-like tone
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Colors.white,
//               Color(0xFFB2D8FF),
//             ],
//             begin: Alignment.topRight,
//             end: Alignment.bottomCenter,
//           ),
//           borderRadius: BorderRadius.only(
//               // bottomLeft: Radius.circular(20),
//               // bottomRight: Radius.circular(20),
//               ),
//         ),
//         child: SafeArea(
//           child: FutureBuilder<List<Currentuserpost>>(
//             future: postFuture,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(
//                   child: CircularProgressIndicator(color: Colors.pinkAccent),
//                 );
//               } else if (snapshot.hasError) {
//                 return Center(
//                   child: Text("Error: ${snapshot.error}"),
//                 );
//               } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                 return const Center(
//                   child: Text("No posts available"),
//                 );
//               }

//               List<Currentuserpost> postList = snapshot.data!;
//               return RefreshIndicator(
//                 onRefresh: () async {
//                   setState(() {
//                     postFuture = getNetworkData();
//                   });
//                 },
//                 child: ListView.builder(
//                   padding: const EdgeInsets.all(5),
//                   itemCount: postList.length,
//                   itemBuilder: (context, index) {
//                     return buildPostCard(postList[index]);
//                   },
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildPostCard(Currentuserpost firebasePost) {
//     final currentUser = FirebaseAuth.instance.currentUser;
//     final postRef = FirebaseFirestore.instance
//         .collection('Postdata')
//         .doc(firebasePost.postId);

//     return StreamBuilder<DocumentSnapshot>(
//       stream: postRef.snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) return const SizedBox();

//         final postData = snapshot.data!.data() as Map<String, dynamic>;
//         final likes = Map<String, dynamic>.from(postData['likes'] ?? {});
//         final isLiked =
//             currentUser != null && likes.containsKey(currentUser.uid);
//         final likeCount = likes.length;

//         return Container(
//           margin: const EdgeInsets.symmetric(vertical: 10),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 blurRadius: 8,
//                 offset: const Offset(0, 3),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Header
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 22,
//                       backgroundImage: NetworkImage(
//                         firebasePost.pic!,
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: Text(
//                         firebasePost.name,
//                         style: GoogleFonts.quicksand(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                     const Icon(Icons.more_horiz, color: Colors.black54),
//                   ],
//                 ),
//               ),

//               // Post Image
//               AspectRatio(
//                 aspectRatio: 1,
//                 child: Image.network(
//                   firebasePost.profilPic,
//                   fit: BoxFit.cover,
//                 ),
//               ),

//               // Action Buttons
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
//                 child: Row(
//                   children: [
//                     Column(
//                       children: [
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         GestureDetector(
//                           onTap: () async {
//                             if (currentUser == null) return;

//                             final userId = currentUser.uid;
//                             if (isLiked) {
//                               await postRef.update(
//                                   {'likes.$userId': FieldValue.delete()});
//                             } else {
//                               await postRef.update({'likes.$userId': true});
//                             }
//                           },
//                           child: Icon(
//                             isLiked ? Icons.favorite : Icons.favorite_border,
//                             color: isLiked ? Colors.red : Colors.black,
//                             size: 26,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 12),
//                           child: Text(
//                             '$likeCount likes',
//                             style: GoogleFonts.quicksand(
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                       ],
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.comment_outlined),
//                       onPressed: () {
//                         showModalBottomSheet(
//                           context: context,
//                           isScrollControlled: true,
//                           shape: const RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.vertical(top: Radius.circular(20)),
//                           ),
//                           builder: (_) => CommentBottomSheet(
//                             postId: firebasePost.postId,
//                             currentuserName: widget.currentUserName,
//                             // currentphoto: widget.currentuserPhoto,
//                             // currentuserPhoto: widget.currentuserPhoto,
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),

//               // Like count

//               // Description
//               if (firebasePost.Description.isNotEmpty)
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                   child: Text(
//                     firebasePost.Description,
//                     style: GoogleFonts.quicksand(fontSize: 14.5),
//                   ),
//                 ),

//               // Comments preview
//               StreamBuilder<QuerySnapshot>(
//                 stream: postRef
//                     .collection('comments')
//                     .orderBy('timestamp', descending: true)
//                     .limit(1)
//                     .snapshots(),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData || snapshot.data!.docs.isEmpty)
//                     return const SizedBox();

//                   final commentData =
//                       snapshot.data!.docs.first.data() as Map<String, dynamic>;
//                   final commentText = commentData['text'] ?? '';

//                   return Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                     child: Text(
//                       'View 1 comment: $commentText',
//                       style: GoogleFonts.quicksand(
//                         fontSize: 13.5,
//                         color: Colors.grey.shade700,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               const SizedBox(height: 10),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget buildActionIcon(IconData icon, String label) {
//     return Column(
//       children: [
//         Icon(icon, size: 22, color: Colors.grey[800]),
//         const SizedBox(height: 3),
//         Text(
//           label,
//           style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
//         ),
//       ],
//     );
//   }
// }

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkcordsapplication/HomePage/commentButton.dart';
import 'package:linkcordsapplication/NavigatorPages/CurrentUser.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;

class LocalPost {
  final String id;
  final String name;
  final String description;
  final String imagePath;

  LocalPost({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imagePath': imagePath,
    };
  }

  factory LocalPost.fromMap(Map<String, dynamic> map) {
    return LocalPost(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      imagePath: map['imagePath'],
    );
  }
}

class PostDatabase {
  static Database? _db;
  Future<Database> get db async => _db ??= await initDb();

  Future<Database> initDb() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path, 'posts.db');
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE posts (
          id TEXT PRIMARY KEY,
          name TEXT,
          description TEXT,
          imagePath TEXT
        )
      ''');
    });
  }

  Future<void> insertPost(LocalPost post) async {
    final dbClient = await db;
    await dbClient.insert('posts', post.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<LocalPost>> getAllPosts() async {
    final dbClient = await db;
    final maps = await dbClient.query('posts');
    return maps.map((map) => LocalPost.fromMap(map)).toList();
  }
}

class HomeScreen extends StatefulWidget {
  dynamic currentUserName;
  HomeScreen({super.key, required this.currentUserName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Currentuserpost> postList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadPosts();
  }

  Future<void> loadPosts() async {
    final db = PostDatabase();
    final localPosts = await db.getAllPosts();

    if (localPosts.isNotEmpty) {
      setState(() {
        postList = localPosts
            .map((post) => Currentuserpost(
                  Description: post.description,
                  name: post.name,
                  pic: '',
                  profilPic: post.imagePath,
                  postId: post.id,
                ))
            .toList();
        isLoading = false;
      });
    }

    final response =
        await FirebaseFirestore.instance.collection("Postdata").get();
    for (var doc in response.docs) {
      final imageUrl = doc['postepic'];
      final fileName = doc.id;
      final imagePath = await downloadAndSaveImage(imageUrl, fileName);
      final localPost = LocalPost(
        id: doc.id,
        name: doc['name'],
        description: doc['Description'],
        imagePath: imagePath,
      );
      await db.insertPost(localPost);
    }

    final updatedLocalPosts = await db.getAllPosts();
    setState(() {
      postList = updatedLocalPosts
          .map((post) => Currentuserpost(
                Description: post.description,
                name: post.name,
                pic: '',
                profilPic: post.imagePath,
                postId: post.id,
              ))
          .toList();
      isLoading = false;
    });
  }

  Future<String> downloadAndSaveImage(String imageUrl, String fileName) async {
    final response = await http.get(Uri.parse(imageUrl));
    final dir = await getApplicationDocumentsDirectory();
    final imagePath = join(dir.path, '$fileName.jpg');
    final file = File(imagePath);
    await file.writeAsBytes(response.bodyBytes);
    return imagePath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFB2D8FF)],
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.pinkAccent))
              : RefreshIndicator(
                  onRefresh: loadPosts,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      return buildPostCard(postList[index]);
                    },
                  ),
                ),
        ),
      ),
    );
  }

  Widget buildPostCard(Currentuserpost firebasePost) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final postRef = FirebaseFirestore.instance
        .collection('Postdata')
        .doc(firebasePost.postId);

    return StreamBuilder<DocumentSnapshot>(
      stream: postRef.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox();

        final postData = snapshot.data!.data() as Map<String, dynamic>;
        final likes = Map<String, dynamic>.from(postData['likes'] ?? {});
        final isLiked =
            currentUser != null && likes.containsKey(currentUser.uid);
        final likeCount = likes.length;

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 3)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    const SizedBox(width: 7),
                    Expanded(
                      child: Text(
                        firebasePost.name,
                        style: GoogleFonts.aclonica(
                            fontSize: 17, fontWeight: FontWeight.w200),
                      ),
                    ),
                    const Icon(Icons.more_horiz, color: Colors.black54),
                  ],
                ),
              ),
              AspectRatio(
                aspectRatio: 1,
                child: Image.file(
                  File(firebasePost.profilPic),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
                child: Row(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () async {
                            if (currentUser == null) return;
                            final userId = currentUser.uid;
                            if (isLiked) {
                              await postRef.update(
                                  {'likes.$userId': FieldValue.delete()});
                            } else {
                              await postRef.update({'likes.$userId': true});
                            }
                          },
                          child: Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                            color: isLiked ? Colors.red : Colors.black,
                            size: 26,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text('$likeCount likes',
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.comment_outlined),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          builder: (_) => CommentBottomSheet(
                            postId: firebasePost.postId,
                            currentuserName: widget.currentUserName,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              if (firebasePost.Description.isNotEmpty)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Text(firebasePost.Description,
                      style: GoogleFonts.quicksand(fontSize: 14.5)),
                ),
              StreamBuilder<QuerySnapshot>(
                stream: postRef
                    .collection('comments')
                    .orderBy('timestamp', descending: true)
                    .limit(1)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const SizedBox();
                  }
                  final commentData =
                      snapshot.data!.docs.first.data() as Map<String, dynamic>;
                  final commentText = commentData['text'] ?? '';
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Text(
                      'View 1 comment: $commentText',
                      style: GoogleFonts.quicksand(
                          fontSize: 13.5, color: Colors.grey.shade700),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
