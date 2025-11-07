import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:linkcordsapplication/ProfilePage/clip.dart';
import 'package:linkcordsapplication/ProfilePage/creat_profil_modal.dart';

String emailid = FirebaseAuth.instance.currentUser!.email!;

List<CreatProfilModal> profilmodel = [
  CreatProfilModal(
      bio: "",
      profilPic: "",
      usreName: "",
      location: "",
      email: "",
      connections: []),
];

Future<void> getData() async {
  profilmodel.clear();

  DocumentSnapshot<Map<String, dynamic>> response = await FirebaseFirestore
      .instance
      .collection("userInfo")
      .doc(FirebaseAuth.instance.currentUser!.email)
      .get();

  profilmodel.add(
    CreatProfilModal(
      usreName: response["UserName"],
      email: response["userEmailid"],
      bio: response["bio"],
      location: response["location"],
      profilPic: response["profilepic"],
      connections: response["connections"],
    ),
  );
  log("${profilmodel[0].connections.length}---------length of conn");
}

class Profile extends StatefulWidget {
  final String username;
  final String userbio;
  final String userLocation;
  final String useremail;
  final String userpic;
  const Profile({
    super.key,
    required this.username,
    required this.userpic,
    required this.userLocation,
    required this.userbio,
    required this.useremail,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

TextEditingController NameEditingController = TextEditingController();
TextEditingController emailEditingController = TextEditingController();
TextEditingController bioEditingController = TextEditingController();
TextEditingController locationEditingController = TextEditingController();

class _ProfileState extends State<Profile> {
  final ImagePicker _imagePicker = ImagePicker();

  XFile? _SelectedFile;

//.........................................SAVE PROFILE CONDITION.......................................................................

  Future<void> uploadImage({required String filename}) async {
    log("ADD data to firestroage");
    await FirebaseStorage.instance
        .ref()
        .child(filename)
        .putFile(File(_SelectedFile!.path));
  }

  Future<String> downloadImageURL({required String filename}) async {
    log("GET URL TO FIREBASE");
    String url =
        await FirebaseStorage.instance.ref().child(filename).getDownloadURL();
    log("UPLOADED URL:$url");
    return url;
  }

  void addDatatofirebase({required String url}) {
    log("upload data to cloud");

    Map<String, dynamic> data = {
      'email': emailEditingController.text.trim().isNotEmpty,
      'profilepic': url,
    };
    FirebaseFirestore.instance.collection("image").add(data);
    _SelectedFile = null;
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("DATA ADDED")));
  }

  Future<void> save(bool doEdit, {required String url}) async {
    log("-----------in add data--------------------");

    if (NameEditingController.text.trim().isNotEmpty &&
        emailEditingController.text.trim().isNotEmpty &&
        bioEditingController.text.trim().isNotEmpty &&
        locationEditingController.text.trim().isNotEmpty) {
      Map<String, dynamic> data = {
        "userName": NameEditingController.text.trim(),
        "email": emailEditingController.text.trim(),
        "bio": bioEditingController.text.trim(),
        "location": locationEditingController.text.trim(),
        "profilePic": url,
        "connections": [],
      };
      await FirebaseFirestore.instance
          .collection("userInfo")
          .doc(emailEditingController.text.trim())
          .set(data);

      log("$data");
      // return url;

      clearControllers();
      setState(() {});
    }
  }

  Future<void> getDataFromFirebase() async {
    profilmodel.cast();
    QuerySnapshot responce =
        await FirebaseFirestore.instance.collection("userInfo").get();

    for (int i = 0; i < profilmodel.length; i++) {
      profilmodel.add(CreatProfilModal(
        usreName: responce.docs[i]['userName'],
        email: responce.docs[i]['email'],
        bio: responce.docs[i]['bio'],
        location: responce.docs[i]['location'],
        profilPic: responce.docs[i]['profilPic'],
        connections: responce.docs[i]['connections'],
      ));
    }
  }

  clearControllers() {
    emailid = emailEditingController.text.trim();
    NameEditingController.clear();
    emailEditingController.clear();
    bioEditingController.clear();
    locationEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () async {
              _SelectedFile =
                  await _imagePicker.pickImage(source: ImageSource.gallery);
              if (_SelectedFile != null) {
                log("FIle = ${_SelectedFile!.path}");
                setState(() {});
              }
            },
            child: Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: ClipPath(
                    clipper: OvalBottomCilipper(),
                    child: Container(
                      color: Colors.amber,
                      child: Image.network(
                          "https://i0.wp.com/picjumbo.com/wp-content/uploads/pure-nature-landscape-single-tree-in-green-field-free-photo.jpg?w=600&quality=80"),
                    ))),
          ),
          Positioned(
            child: Container(
              padding: const EdgeInsets.only(left: 15, top: 80, right: 15),
              child: GestureDetector(
                onTap: () async {
                  _SelectedFile =
                      await _imagePicker.pickImage(source: ImageSource.gallery);
                  if (_SelectedFile != null) {
                    log("FIle = ${_SelectedFile!.path}");
                    setState(() {});
                  }
                },
                child: ListView(
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          //.........................................PROFILE IMAGE.......................................................................
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              border: Border.all(width: 4, color: Colors.white),
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: const [
                                BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black,
                                )
                              ],
                              /*  shape: BoxShape.circle,
                                image: const DecorationImage(
                                fit: BoxFit.fill,*/

                              // image: NetworkImage("https://static.vecteezy.com/system/resources/thumbnails/005/544/718/small_2x/profile-icon-design-free-vector.jpg")),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: (_SelectedFile == null)
                                  ? Image.network(
                                      "https://static.vecteezy.com/system/resources/thumbnails/005/544/718/small_2x/profile-icon-design-free-vector.jpg",
                                      width: 130,
                                      height: 130,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.file(
                                      File(_SelectedFile!.path),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              width: 40,
                              child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 4,
                                      color: Colors.white,
                                    ),
                                    color: Colors.blue,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 30,
                                                  left: 10,
                                                  right: 10,
                                                  bottom: 30,
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        height: 40,
                                                        width: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              spreadRadius: 2,
                                                              blurRadius: 10,
                                                            )
                                                          ],
                                                          color: Colors.white,
                                                        ),
                                                        child: IconButton(
                                                            onPressed:
                                                                () async {
                                                              _SelectedFile =
                                                                  await _imagePicker
                                                                      .pickImage(
                                                                          source:
                                                                              ImageSource.gallery);
                                                            },
                                                            icon: const Icon(Icons
                                                                .folder_copy_outlined)),
                                                      ),
                                                      const SizedBox(width: 70),
                                                      Container(
                                                        height: 40,
                                                        width: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              spreadRadius: 2,
                                                              blurRadius: 10,
                                                            )
                                                          ],
                                                          color: Colors.white,
                                                        ),
                                                        child: IconButton(
                                                            onPressed:
                                                                () async {
                                                              _SelectedFile =
                                                                  await _imagePicker
                                                                      .pickImage(
                                                                          source:
                                                                              ImageSource.camera);
                                                            },
                                                            icon: const Icon(Icons
                                                                .camera_alt_outlined)),
                                                      ),
                                                    ],
                                                  ),
                                                ));
                                          });
                                    },
                                    icon: const Icon(Icons.add),
                                  ))),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: NameEditingController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        hintText: "Name",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: emailEditingController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20))),
                          hintText: "enter emailID",
                          suffixIcon: Icon(Icons.email_outlined)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: bioEditingController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        hintText: "bio",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: locationEditingController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        hintText: "Location",
                        suffixIcon: Icon(Icons.location_on_outlined),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //.........................................SAVE PROFILE.......................................................................
                    ElevatedButton(
                        onPressed: () async {
                          log("data adding");
                          String filename = _SelectedFile!.name;
                          await save(true, url: filename);
                          await getData();
                          await uploadImage(filename: filename);
                          String url =
                              await downloadImageURL(filename: filename);
                          addDatatofirebase(url: url);
                          await getDataFromFirebase();

                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const Profile1(Username: null,)));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 110, vertical: 16),
                            child: Text(
                              "SAVE",
                              style: TextStyle(color: Colors.white),
                            ))),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
