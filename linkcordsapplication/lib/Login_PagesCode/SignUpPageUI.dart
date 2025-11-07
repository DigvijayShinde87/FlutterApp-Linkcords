import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:linkcordsapplication/Login_PagesCode/CustomSnackbar.dart';

class SignupPageUI extends StatefulWidget {
  const SignupPageUI({super.key});

  @override
  State<StatefulWidget> createState() => _SignupPageUIState();
}

class _SignupPageUIState extends State<SignupPageUI> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userEmailid = TextEditingController();
  final TextEditingController userPasswordController = TextEditingController();
  final TextEditingController userbiocontroller = TextEditingController();
  final TextEditingController userlocationController = TextEditingController();

  final ImagePicker _imagePicker = ImagePicker();

  XFile? _selectedFile;
  bool _showPassword = true;
  bool _isLoading = false; // loading state

  final FirebaseAuth _authentication = FirebaseAuth.instance;

  Future<void> uploadImage({required String filename}) async {
    log("Uploading image to Firebase Storage...");
    await FirebaseStorage.instance
        .ref()
        .child(filename)
        .putFile(File(_selectedFile!.path));
  }

  Future<String> downloadImageURL({required String filename}) async {
    log("Getting download URL from Firebase Storage...");
    String url =
        await FirebaseStorage.instance.ref().child(filename).getDownloadURL();
    log("Download URL: $url");
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // Title & Subtitle
              Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.indigo.shade900,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Register now and unlock your potential",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.indigo.shade700,
                ),
              ),

              const SizedBox(height: 40),

              // Profile Image Picker with border
              GestureDetector(
                onTap: () async {
                  _selectedFile = await _imagePicker.pickImage(
                      source: ImageSource.gallery, imageQuality: 70);
                  if (_selectedFile != null) {
                    setState(() {});
                  }
                },
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.indigo.shade100,
                  child: _selectedFile == null
                      ? ClipOval(
                          child: Image.network(
                            "https://static.vecteezy.com/system/resources/thumbnails/005/544/718/small_2x/profile-icon-design-free-vector.jpg",
                            width: 130,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                        )
                      : ClipOval(
                          child: Image.file(
                            File(_selectedFile!.path),
                            width: 130,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 30),

              // Input Fields with label & nicer styling
              _buildInputField(
                label: "Name",
                controller: userNameController,
                hintText: "Enter your name",
                icon: Icons.person_outline,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 20),
              _buildInputField(
                label: "Email",
                controller: userEmailid,
                hintText: "Enter your email",
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              _buildInputField(
                label: "Password",
                controller: userPasswordController,
                hintText: "Enter your password",
                icon: _showPassword ? Icons.visibility_off : Icons.visibility,
                obscureText: _showPassword,
                suffixTap: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
              ),
              const SizedBox(height: 20),
              _buildInputField(
                label: "Bio",
                controller: userbiocontroller,
                hintText: "Write a short bio",
                icon: Icons.info_outline,
              ),
              const SizedBox(height: 20),
              _buildInputField(
                label: "Location",
                controller: userlocationController,
                hintText: "Enter your location",
                icon: Icons.location_on_outlined,
              ),
              const SizedBox(height: 40),

              // Register Button with loader
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _isLoading
                      ? null
                      : () async {
                          if (userNameController.text.trim().isNotEmpty &&
                              userPasswordController.text.isNotEmpty &&
                              userEmailid.text.trim().isNotEmpty &&
                              userbiocontroller.text.trim().isNotEmpty &&
                              userlocationController.text.trim().isNotEmpty &&
                              _selectedFile != null) {
                            setState(() {
                              _isLoading = true;
                            });

                            String filename = _selectedFile!.name;

                            try {
                              await uploadImage(filename: filename);
                              String url =
                                  await downloadImageURL(filename: filename);

                              Map<String, dynamic> data = {
                                "UserName": userNameController.text.trim(),
                                "UserPassword":
                                    userPasswordController.text.trim(),
                                "userEmailid": userEmailid.text.trim(),
                                "connections": [],
                                "bio": userbiocontroller.text.trim(),
                                "location": userlocationController.text.trim(),
                                  
                              };

                              UserCredential userCredential =
                                  await _authentication
                                      .createUserWithEmailAndPassword(
                                email: userEmailid.text.trim(),
                                password: userPasswordController.text.trim(),
                              );

                              await FirebaseFirestore.instance
                                  .collection("userInfo")
                                  .doc(userEmailid.text.trim())
                                  .set(data);

                              CustomSnackBar.showCustomSnackbar(
                                message: "User Registered Successfully!",
                                context: context,
                              );

                              Navigator.of(context).pop();
                            } on FirebaseAuthException catch (error) {
                              CustomSnackBar.showCustomSnackbar(
                                  message:
                                      error.message ?? "Registration Failed",
                                  context: context);
                              log("Firebase Auth Error: ${error.code}");
                            } catch (e) {
                              CustomSnackBar.showCustomSnackbar(
                                  message: "An error occurred: $e",
                                  context: context);
                            } finally {
                              if (mounted) {
                                setState(() {
                                  _isLoading = false;
                                });
                              }
                            }
                          } else {
                            CustomSnackBar.showCustomSnackbar(
                                message:
                                    "Please fill all fields and select a profile picture.",
                                context: context);
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isLoading
                        ? Colors.indigo.shade300
                        : Colors.indigo.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                    shadowColor: Colors.indigo.shade300,
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          width: 28,
                          height: 28,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                          ),
                        )
                      : const Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    IconData? icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    VoidCallback? suffixTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.indigo.shade900),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          cursorColor: Colors.indigo.shade900,
          style: const TextStyle(fontSize: 16),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.indigo.shade300),
            prefixIcon:
                icon != null ? Icon(icon, color: Colors.indigo.shade700) : null,
            suffixIcon: suffixTap != null
                ? GestureDetector(
                    onTap: suffixTap,
                    child: Icon(
                      icon,
                      color: Colors.indigo.shade700,
                    ),
                  )
                : null,
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.indigo.shade200),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.indigo.shade100),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.indigo.shade500, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
