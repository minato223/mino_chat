import 'package:flutter/material.dart';

class AppCustomClipper extends CustomClipper<Path> {
  bool? reverse;
  double clipHeight;
  AppCustomClipper({this.reverse, required this.clipHeight});
  @override
  getClip(Size size) {
    bool isReverse = reverse == true;
    double x = size.width;
    double y = size.height;
    double center = (y - (clipHeight / 2));
    Path path = Path();
    if (isReverse) {
      path
        ..lineTo(0, y - clipHeight)
        ..quadraticBezierTo(0, center, x * .25, center)
        ..lineTo(x * .75, center)
        ..quadraticBezierTo(x, center, x, y)
        ..lineTo(x, 0)
        ..close();
      return path;
    }
    path
      ..lineTo(0, y)
      ..quadraticBezierTo(0, center, x * .25, center)
      ..lineTo(x * .75, center)
      ..quadraticBezierTo(x, center, x, y - clipHeight)
      ..lineTo(x, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
