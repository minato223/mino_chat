// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TranslateAnimation extends StatelessWidget {
  TranslateAnimation(
      {super.key,
      required this.child,
      required this.animationValue,
      required this.offsetY,
      this.direction});
  TranslateAnimationDirection? direction;
  final Widget child;
  final double animationValue;
  final double offsetY;
  @override
  Widget build(BuildContext context) {
    double opacity = ((animationValue / offsetY) - 1) * (-1);
    Offset offset = Offset(0, animationValue);
    if (direction == TranslateAnimationDirection.x) {
      offset = Offset(animationValue, 0);
      opacity = ((animationValue / offsetY) + 1);
    }
    return Transform.translate(
      offset: offset,
      child: Opacity(opacity: opacity, child: child),
    );
  }
}

enum TranslateAnimationDirection { x, y }
