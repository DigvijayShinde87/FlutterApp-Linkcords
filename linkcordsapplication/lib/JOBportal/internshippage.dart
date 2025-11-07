
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:linkcordsapplication/JOBportal/jobs1.dart';
import 'package:linkcordsapplication/JOBportal/jobs2.dart';
import 'package:linkcordsapplication/JOBportal/jobs3.dart';
import 'package:linkcordsapplication/JOBportal/jobs4.dart';

class InternshipPage extends StatefulWidget {
  const InternshipPage({super.key});

  @override
  State<StatefulWidget> createState() => _InternshipState();
}

class _InternshipState extends State<InternshipPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(35)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Discover",
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "Your Dream Job",
                    style: GoogleFonts.poppins(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF134074),
                    ),
                  ),
                ],
              ),
            ),

            // BODY
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  Text(
                    "Trending Jobs",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  JobCard(
                    rank: "#1",
                    title: "Jobs for Freshers",
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Jobs1()),
                    ),
                  ),
                  const SizedBox(height: 20),
                  JobCard(
                    rank: "#2",
                    title: "Part Time Jobs",
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Jobs2()),
                    ),
                  ),
                  const SizedBox(height: 20),
                  JobCard(
                    rank: "#3",
                    title: "Work From Home",
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Jobs3()),
                    ),
                  ),
                  const SizedBox(height: 20),
                  JobCard(
                    rank: "#4",
                    title: "Jobs for Women",
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Jobs4()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final String rank;
  final String title;
  final VoidCallback onTap;

  const JobCard({
    super.key,
    required this.rank,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Ink(
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [
                Color(0xFFF8FAFC),
                Color(0xFFDCEFFF),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 4),
              )
            ],
            border: Border.all(color: const Color(0xFF134074), width: 1.2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Trending $rank",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF134074),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF134074),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                  ),
                  child: const Text(
                    "View All",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
