import 'dart:math';

import 'package:flutter/material.dart';

class RandomBezierClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50); // Start from the left bottom corner

    var rnd = Random();
    var firstControlPoint1 = Offset(0, size.height - 60 + rnd.nextInt(30) - 15);
    var firstControlPoint2 =
        Offset(size.width / 3, size.height / 2 + rnd.nextInt(30) - 15);
    var firstEndPoint = Offset(size.width / 2, size.height / 2);
    path.cubicTo(
        firstControlPoint1.dx,
        firstControlPoint1.dy,
        firstControlPoint2.dx,
        firstControlPoint2.dy,
        firstEndPoint.dx,
        firstEndPoint.dy);

    var secondControlPoint1 = Offset(
        size.width - (size.width / 3), size.height / 2 + rnd.nextInt(30) - 15);
    var secondControlPoint2 = Offset(
        size.width - (size.width / 4), size.height - 50 + rnd.nextInt(30) - 15);
    var secondEndPoint = Offset(size.width, size.height - 50);
    path.cubicTo(
        secondControlPoint1.dx,
        secondControlPoint1.dy,
        secondControlPoint2.dx,
        secondControlPoint2.dy,
        secondEndPoint.dx,
        secondEndPoint.dy);

    path.lineTo(size.width, 0); // Go to the right top corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) =>
      true; // Recompute the clip each time
}
