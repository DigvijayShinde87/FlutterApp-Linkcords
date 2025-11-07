import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String currentUserId;
  final String receiverId;
  final String receiverName;
  final String receiverPic;

  const ChatPage({
    super.key,
    required this.currentUserId,
    required this.receiverId,
    required this.receiverName,
    required this.receiverPic,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();

  String getChatId() {
    final ids = [widget.currentUserId, widget.receiverId];
    ids.sort();
    return ids.join("_");
  }

  void sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    FirebaseFirestore.instance
        .collection('chats')
        .doc(getChatId())
        .collection('messages')
        .add({
      'senderId': widget.currentUserId,
      'receiverId': widget.receiverId,
      'text': _controller.text.trim(),
      'timestamp': FieldValue.serverTimestamp(),
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final chatId = getChatId();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 188, 212, 249),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.receiverPic),
            ),
            const SizedBox(width: 10),
            Text(widget.receiverName),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('chats')
                  .doc(chatId)
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final messages = snapshot.data!.docs;

                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    var msg = messages[index];
                    bool isMe = msg['senderId'] == widget.currentUserId;

                    return Align(
                      alignment:
                          isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isMe
                              ? const Color.fromARGB(255, 148, 202, 255)
                              : const Color.fromARGB(255, 236, 236, 236),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          msg['text'],
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const Divider(height: 1),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 228, 241, 255),
              boxShadow: [
                BoxShadow(
                    blurRadius: 3,
                    color: Colors.grey.withOpacity(0.4),
                    offset: const Offset(1, 1))
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Type a message...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blueAccent),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
