import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

class CreatPost extends StatefulWidget {
  final String Username;
  final String profilPic;

  const CreatPost({
    super.key,
    required this.Username,
    required this.profilPic,
  });

  @override
  State<CreatPost> createState() => _CreatPostState();
}

class _CreatPostState extends State<CreatPost> {
  TextEditingController descriptionController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _selectedFile;

  bool isUploading = false;

  Future<void> uploadImage(String filename) async {
    log("Uploading image to Firebase Storage...");
    await FirebaseStorage.instance
        .ref()
        .child(filename)
        .putFile(File(_selectedFile!.path));
  }

  Future<String> downloadImageURL(String filename) async {
    log("Fetching image download URL...");
    String url =
        await FirebaseStorage.instance.ref().child(filename).getDownloadURL();
    log("Download URL: $url");
    return url;
  }

  Future<void> addDataToFirebase(String imageUrl) async {
    log("Uploading post data to Firestore...");
    Map<String, dynamic> data = {
      'name': widget.Username,
      'pic': widget.profilPic,
      'Description': descriptionController.text.trim(),
      'postepic': imageUrl,
      'timestamp': Timestamp.now(),
      'likes': {},
    };

    await FirebaseFirestore.instance
        .collection("Postdata")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .set(data);
    _selectedFile = null;
    descriptionController.clear();

    toast("Post uploaded successfully!");
  }

  void handlePostUpload() async {
    if (descriptionController.text.trim().isEmpty || _selectedFile == null) {
      toast("Please provide a description and select an image.");
      return;
    }

    setState(() => isUploading = true);

    try {
      String filename = _selectedFile!.name;
      await uploadImage(filename);
      String imageUrl = await downloadImageURL(filename);
      await addDataToFirebase(imageUrl);
    } catch (e) {
      toast("Error: $e");
    }

    setState(() => isUploading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
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
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.profilPic),
              radius: 20,
            ),
            const SizedBox(width: 12),
            Text(
              widget.Username,
              style: GoogleFonts.quicksand(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: descriptionController,
              cursorColor: Colors.black,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "What's on your mind?",
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                final pickedFile =
                    await _imagePicker.pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  _selectedFile = pickedFile;
                  setState(() {});
                }
              },
              child: Container(
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: _selectedFile == null
                    ? const Center(
                        child: Text(
                          "Tap to select image",
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          File(_selectedFile!.path),
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 30),
            isUploading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: handlePostUpload,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6BA9E6),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Post",
                      style: GoogleFonts.quicksand(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
