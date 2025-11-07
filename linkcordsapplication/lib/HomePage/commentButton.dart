import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentBottomSheet extends StatefulWidget {
  final String postId;
  dynamic currentuserName;
  // dynamic currentphoto;

  CommentBottomSheet(
      {super.key,
      required this.currentuserName,
      // required this.currentphoto,
      required this.postId});

  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  final TextEditingController _controller = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    postComment();
  }

  void postComment() async {
    dynamic userData = await FirebaseFirestore.instance
        .collection('userInfo')
        .doc(user?.email)
        .get();

    log('UserData: $userData');
    log(userData['UserName']);
    final text = _controller.text.trim();
    if (text.isEmpty || user == null) return;

    await FirebaseFirestore.instance
        .collection('posts')
        .doc(widget.postId)
        .collection('comments')
        .add({
      'text': text,
      'userId': userData['UserName'],
      'userPhoto': userData['profilepic'],
      'timestamp': FieldValue.serverTimestamp(),
    });

    _controller.clear();
  }

  Future<Map<String, dynamic>?> getUser(String userId) async {
    final doc = await FirebaseFirestore.instance
        .collection('userInfo')
        .doc(userId)
        .get();
    return doc.exists ? doc.data() : null;
  }

  @override
  Widget build(BuildContext context) {
    final commentStream = FirebaseFirestore.instance
        .collection('posts')
        .doc(widget.postId)
        .collection('comments')
        .orderBy('timestamp', descending: true)
        .snapshots();

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      builder: (_, controller) => Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
                height: 5,
                width: 40,
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10))),
            const Text("Comments",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 10),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: commentStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final comments = snapshot.data!.docs;

                  return ListView.builder(
                    controller: controller,
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      final data =
                          comments[index].data() as Map<String, dynamic>;
                      final userId = data['userId'];

                      return FutureBuilder<Map<String, dynamic>?>(
                        future: getUser(userId),
                        builder: (context, userSnapshot) {
                          final user = userSnapshot.data;
                          final username = data['userId'] ?? 'User';
                          final pic = data['userPhoto'] ??
                              'https://static.vecteezy.com/system/resources/thumbnails/005/544/718/small_2x/profile-icon-design-free-vector.jpg';

                          return ListTile(
                            leading: Container(
                                width: 45,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    shape: BoxShape.circle),
                                clipBehavior: Clip.antiAlias,
                                child: Image.network(
                                  pic,
                                  fit: BoxFit.cover,
                                )),
                            title: Text(username,
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w600)),
                            subtitle: Text(data['text'] ?? '',
                                style: GoogleFonts.quicksand()),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Write a comment...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: postComment,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}