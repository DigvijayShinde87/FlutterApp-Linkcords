import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class PostDetailPage extends StatelessWidget {
  final Map<String, dynamic> post;

  const PostDetailPage({required this.post, super.key});

  @override
  Widget build(BuildContext context) {
    final likes = (post['likes'] ?? {}) as Map<String, dynamic>;
    final likeCount = likes.length;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        titleSpacing: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: [
            const SizedBox(width: 8),
            CircleAvatar(
              backgroundImage: NetworkImage(post['profilePic']),
              radius: 18,
            ),
            const SizedBox(width: 12),
            Text(
              post['name'] ?? '',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Post Image with rounded corners
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Hero(
                tag: post['PostPic'],
                child: Image.network(
                  post['PostPic'],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                  children: [
                    TextSpan(
                      text: post['name'] ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '  ${post['Description'] ?? ''}'),
                  ],
                ),
              ),
            ),
            // Action Row
            Row(
              children: [
                IconButton(
                  icon: const Icon(FontAwesomeIcons.heart, size: 25),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.comment_outlined, size: 25),
                  onPressed: () {},
                ),
              ],
            ),

            // Likes count
            Padding(
              padding: const EdgeInsets.only(left: 4, bottom: 8),
              child: Text(
                "$likeCount likes",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),

            // buildPostCard(    ),

            const SizedBox(height: 8)          
          ],
        ),
      ),
    );
  }

  // Widget buildPostCard(Currentuserpost firebasePost) {
  //   final currentUser = FirebaseAuth.instance.currentUser;
  //   final postRef = FirebaseFirestore.instance
  //       .collection('Postdata')
  //       .doc(firebasePost.postId);

  //   return StreamBuilder<DocumentSnapshot>(
  //     stream: postRef.snapshots(),
  //     builder: (context, snapshot) {
  //       if (!snapshot.hasData) return const SizedBox();

  //       final postData = snapshot.data!.data() as Map<String, dynamic>;
  //       final likes = Map<String, dynamic>.from(postData['likes'] ?? {});
  //       final isLiked =
  //           currentUser != null && likes.containsKey(currentUser.uid);
  //       final likeCount = likes.length;

  //       return Container(
  //         margin: const EdgeInsets.symmetric(vertical: 10),
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(12),
  //           boxShadow: [
  //             BoxShadow(
  //               color: Colors.grey.withOpacity(0.2),
  //               blurRadius: 8,
  //               offset: const Offset(0, 3),
  //             ),
  //           ],
  //         ),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             // Action Buttons
  //             Padding(
  //               padding:
  //                   const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
  //               child: Row(
  //                 children: [
  //                   Column(
  //                     children: [
  //                       const SizedBox(
  //                         height: 10,
  //                       ),
  //                       GestureDetector(
  //                         onTap: () async {
  //                           if (currentUser == null) return;

  //                           final userId = currentUser.uid;
  //                           if (isLiked) {
  //                             await postRef.update(
  //                                 {'likes.$userId': FieldValue.delete()});
  //                           } else {
  //                             await postRef.update({'likes.$userId': true});
  //                           }
  //                         },
  //                         child: Icon(
  //                           isLiked ? Icons.favorite : Icons.favorite_border,
  //                           color: isLiked ? Colors.red : Colors.black,
  //                           size: 26,
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.symmetric(horizontal: 12), 
  //                         child: Text(
  //                           '$likeCount likes',
  //                           style: GoogleFonts.quicksand(
  //                               fontWeight: FontWeight.w600),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   IconButton(
  //                     icon: const Icon(Icons.comment_outlined),
  //                     onPressed: () {
  //                       showModalBottomSheet(
  //                         context: context,
  //                         isScrollControlled: true,
  //                         shape: const RoundedRectangleBorder(
  //                           borderRadius:
  //                               BorderRadius.vertical(top: Radius.circular(20)),
  //                         ),
  //                         builder: (_) => CommentBottomSheet(
  //                           postId: firebasePost.postId,
  //                           currentuserName: post['name'],
  //                           // currentphoto: widget.currentuserPhoto,
  //                           // currentuserPhoto: widget.currentuserPhoto,
  //                         ),
  //                       );
  //                     },
  //                   ),
  //                 ],
  //               ),
  //             ),

  //             StreamBuilder<QuerySnapshot>(
  //               stream: postRef
  //                   .collection('comments')
  //                   .orderBy('timestamp', descending: true)
  //                   .limit(1)
  //                   .snapshots(),
  //               builder: (context, snapshot) {
  //                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty)
  //                   return const SizedBox();

  //                 final commentData =
  //                     snapshot.data!.docs.first.data() as Map<String, dynamic>;
  //                 final commentText = commentData['text'] ?? '';

  //                 return Padding(
  //                   padding:
  //                       const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
  //                   child: Text(
  //                     'View 1 comment: $commentText',
  //                     style: GoogleFonts.quicksand(
  //                       fontSize: 13.5,
  //                       color: Colors.grey.shade700,
  //                     ),
  //                   ),
  //                 );
  //               },
  //             ),
  //             const SizedBox(height: 10),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  // Widget buildActionIcon(IconData icon, String label) {
  //   return Column(
  //     children: [
  //       Icon(icon, size: 22, color: Colors.grey[800]),
  //       const SizedBox(height: 3),
  //       Text(
  //         label,
  //         style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
  //       ),
  //     ],
  //   );
  // }
}
