import 'package:flutter/material.dart';

class RoundedBottomClipper extends CustomClipper<Path> {
  final double height;

  const RoundedBottomClipper({required this.height});

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * height); // left side
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height * height); // curve
    path.lineTo(size.width, 0); // right side
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
