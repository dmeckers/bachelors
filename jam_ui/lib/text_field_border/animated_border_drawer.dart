import 'package:flutter/material.dart';
import 'package:jam_ui/text_field_border/path_drawer.dart';

class CustomAnimateBorder extends CustomPainter {
  final double animationPercent; // 0.0 to 1.0
  final double? stroke;
  final Color? color;
  final double rounding;

  CustomAnimateBorder({
    required this.animationPercent,
    this.stroke,
    this.color,
    this.rounding = 0.0,
  });
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.strokeWidth = stroke ?? 2.0;
    paint.color = color ?? Colors.black;
    paint.style = PaintingStyle.stroke;

    var path = Path();
    path.moveTo(0, size.height / 2);

    path.lineTo(0, 18);
    path.quadraticBezierTo(0, 0, rounding, 0);
    path.lineTo(size.width - rounding, 0);
    path.quadraticBezierTo(size.width, 0, size.width, rounding);
    path.lineTo(size.width, size.height / 2);

    var path2 = Path();
    path2.moveTo(0, size.height / 2);

    path2.lineTo(0, size.height - rounding);
    path2.quadraticBezierTo(0, size.height, rounding, size.height);
    path2.lineTo(size.width - rounding, size.height);
    path2.quadraticBezierTo(
        size.width, size.height, size.width, size.height - rounding);
    path2.lineTo(size.width, size.height / 2);

    final p1 = TextFieldPathDrawer.createAnimatedPath(path, animationPercent);
    final p2 = TextFieldPathDrawer.createAnimatedPath(path2, animationPercent);

    canvas.drawPath(p1, paint);
    canvas.drawPath(p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
