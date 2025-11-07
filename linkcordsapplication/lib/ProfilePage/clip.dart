import 'package:flutter/material.dart';

class OvalBottomCilipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height / 2.1);
    path.quadraticBezierTo(
        size.width / 1.9, size.height, size.width, size.height / 1.9);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
