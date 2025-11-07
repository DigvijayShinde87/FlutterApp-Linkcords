import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'ChatPage.dart';

class UserListPage extends StatefulWidget {
  final String currentUserId;

  const UserListPage({super.key, required this.currentUserId});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('userInfo').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          dynamic users = snapshot.data!.docs[2]['connections'];
          log('$users');
          // users = ['aparnagavada@gmail.com', 'ayushmane@gmail.com'];

          // List userConnections = profilmodel[0].connections;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              // var user = users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(users[index] ??
                      "https://static.vecteezy.com/system/resources/thumbnails/005/544/718/small_2x/profile-icon-design-free-vector.jpg"),
                ),
                title: Text(users[index] ?? 'Unknown'),
                // subtitle: Text(user['userEmailid'] ?? ''),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatPage(
                        currentUserId: widget.currentUserId,
                        receiverId: users[index],
                        receiverName: users[index],
                        receiverPic: users[index],
                      ),
                    ),
                  );
                },
                
              );
            },
            
          );
        },
      ),
    );
  }
}
