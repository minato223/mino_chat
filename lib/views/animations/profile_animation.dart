// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/animation.dart';

class ProfileAnimation {
  static const offsetY = 20.0;
  late AnimationController _controller;
  static Tween<double> baseTween = Tween<double>(begin: 0, end: 1);
  static Tween<double> offsetTween = Tween<double>(begin: offsetY, end: 0);
  Animation<double> avatarAnimation;
  Animation<double> titleAnimation;
  Animation<double> subTitleAnimation;
  Animation<double> totalConnectedAnimation;
  Animation<double> recentlyConnectedAnimation;
  ProfileAnimation(this._controller)
      : avatarAnimation = baseTween.animate(CurvedAnimation(
            parent: _controller,
            curve: const Interval(0, .2, curve: Curves.decelerate))),
        titleAnimation = offsetTween.animate(CurvedAnimation(
            parent: _controller,
            curve: const Interval(.2, .4, curve: Curves.bounceOut))),
        subTitleAnimation = offsetTween.animate(CurvedAnimation(
            parent: _controller,
            curve: const Interval(.4, .6, curve: Curves.decelerate))),
        totalConnectedAnimation = offsetTween.animate(CurvedAnimation(
            parent: _controller,
            curve: const Interval(.6, .8, curve: Curves.decelerate))),
        recentlyConnectedAnimation = offsetTween.animate(CurvedAnimation(
            parent: _controller,
            curve: const Interval(.8, 1, curve: Curves.decelerate)));
}
