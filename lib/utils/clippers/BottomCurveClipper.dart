import 'dart:ui';

import 'package:flutter/material.dart';

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);  // Move lower to create a deeper curve
    path.quadraticBezierTo(
        size.width / 2, size.height + 50,  // Move control point down
        size.width, size.height - 50);     // Move end point lower
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}