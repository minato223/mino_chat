// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/animation.dart';

class LandscapeAnimation {
  static const offsetY = 20.0;
  late AnimationController _controller;
  Animation<double> clipAnimation;
  Animation<double> imageAnimation;
  Animation<double> titleAnimation;
  Animation<double> subTitleAnimation;
  Animation<double> startButton;
  LandscapeAnimation(this._controller)
      : clipAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
            parent: _controller,
            curve: const Interval(0, .1, curve: Curves.decelerate))),
        imageAnimation = Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
                parent: _controller,
                curve: const Interval(.2, .4, curve: Curves.bounceOut))),
        titleAnimation = Tween<double>(begin: offsetY, end: 0).animate(
            CurvedAnimation(
                parent: _controller,
                curve: const Interval(.4, .6, curve: Curves.decelerate))),
        subTitleAnimation = Tween<double>(begin: offsetY, end: 0).animate(
            CurvedAnimation(
                parent: _controller,
                curve: const Interval(.6, .8, curve: Curves.decelerate))),
        startButton = Tween<double>(begin: -offsetY, end: 0).animate(
            CurvedAnimation(
                parent: _controller,
                curve: const Interval(.8, 1, curve: Curves.decelerate)));
}
