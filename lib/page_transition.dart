import 'package:flutter/material.dart';
import 'dart:math';

Route pageAnimatedRoute({required Widget page}) {
  return PageRouteBuilder(
      pageBuilder: ((context, animation, secondaryAnimation) => page),
      transitionsBuilder: (context, animation, secondAnimation, child) {
        return ClipPath(
          clipper: RippleClipper(origin: 'LeftDown', progress: animation.value),
          child: child,
        );
      });
}

class RippleClipper extends CustomClipper<Path> {
  RippleClipper({required this.origin, required this.progress});
  final String origin;
  final double progress;

  @override
  Path getClip(Size size) {
    Map center = <String, Offset>{
      'Left': Offset(0, size.height),
      'Right': Offset(size.width, size.height),
      'LeftDown': const Offset(0, 0),
      'RightDown': Offset(size.width, 0),
      'Middle': Offset(size.width * .5, size.height * .5),
    };
    Path path = Path();
    double radius = sqrt(pow(size.width, 2) + pow(size.height, 2));
    path.addOval(
        Rect.fromCircle(center: center[origin], radius: radius * progress));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
