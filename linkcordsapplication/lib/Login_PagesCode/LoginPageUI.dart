
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkcordsapplication/Login_PagesCode/SessionData.dart';
import 'package:linkcordsapplication/NavigatorPages/AppUser.dart';
import 'package:linkcordsapplication/Login_PagesCode/SignUpPageUI.dart';  
import 'package:linkcordsapplication/root_page.dart';
import 'package:page_transition/page_transition.dart';
import 'CustomSnackbar.dart';

class LoginScreenUI extends StatefulWidget {
  const LoginScreenUI({super.key});

  @override
  State<LoginScreenUI> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenUI> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userPasswordController = TextEditingController();
  final FirebaseAuth _authentication = FirebaseAuth.instance;

  List<AppUser> UserData = [];
  bool _showPassword = false;
  String? errorMessage;
  bool _isLoading = false; // loading state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF3F6),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo or Title
                Text(
                  'Welcome Back!',
                  style: GoogleFonts.montserrat(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2E4A91),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Text(
                  'Login to your account and continue',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                // Email Label & TextField
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: userNameController,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: const Color(0xFF2E4A91),
                  style: GoogleFonts.poppins(fontSize: 16),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFF2E4A91)),
                    hintText: 'Enter your email',
                    hintStyle: GoogleFonts.poppins(color: Colors.grey[400]),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Password Label & TextField
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: userPasswordController,
                  obscureText: !_showPassword,
                  cursorColor: const Color(0xFF2E4A91),
                  style: GoogleFonts.poppins(fontSize: 16),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF2E4A91)),
                    hintText: 'Enter your password',
                    hintStyle: GoogleFonts.poppins(color: Colors.grey[400]),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      child: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Error Message
                if (errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      errorMessage!,
                      style: GoogleFonts.poppins(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                const SizedBox(height: 30),

                // Login Button with loader
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: _isLoading
                        ? null
                        : () async {
                            setState(() {
                              errorMessage = null;
                              _isLoading = true;
                            });

                            if (userNameController.text.trim().isEmpty ||
                                userPasswordController.text.trim().isEmpty) {
                              setState(() {
                                errorMessage = "Please fill in all fields!";
                                _isLoading = false;
                              });
                              return;
                            }

                            try {
                              final UserCredential userCredential =
                                  await _authentication.signInWithEmailAndPassword(
                                email: userNameController.text.trim(),
                                password: userPasswordController.text.trim(),
                              );

                              DocumentSnapshot currentLoggedInuserdata =
                                  await FirebaseFirestore.instance
                                      .collection("userInfo")
                                      .doc(FirebaseAuth.instance.currentUser!.email)
                                      .get();

                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return RootPage(
                                      email: currentLoggedInuserdata['userEmailid'],
                                      picUR: currentLoggedInuserdata['profilepic'],
                                      username: currentLoggedInuserdata['UserName'],
                                      bio: currentLoggedInuserdata['bio'],
                                      location: currentLoggedInuserdata['location'],
                                    );
                                  },
                                ),
                              );

                              await SessionData.storeSessionData(
                                loginData: true,
                                emailId: userCredential.user!.email!,
                              );
                            } on FirebaseAuthException catch (error) {
                              log("Error: ${error.code}");
                              log("Error: ${error.message}");

                              setState(() {
                                errorMessage = error.message ?? "Login failed";
                              });

                              CustomSnackBar.showCustomSnackbar(
                                  message: error.code, context: context);
                            } finally {
                              if (mounted) {
                                setState(() {
                                  _isLoading = false;
                                });
                              }
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isLoading
                          ? const Color(0xFF7F95CB)
                          : const Color(0xFF2E4A91),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 6,
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
                        : Text(
                            'Login',
                            style: GoogleFonts.montserrat(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),

                const SizedBox(height: 30),

                // Register Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const SignupPageUI(),
                            type: PageTransitionType.leftToRightWithFade,
                            duration: const Duration(milliseconds: 300),
                          ),
                        );
                      },
                      child: Text(
                        'Register',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF2E4A91),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
