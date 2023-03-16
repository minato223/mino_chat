// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/animation.dart';

class HomeAnimation {
  static const offsetY = -10.0;
  late AnimationController _controller;
  static Tween<double> baseTween = Tween<double>(begin: 0, end: 1);
  static Tween<double> offsetTween = Tween<double>(begin: offsetY, end: 0);
  Animation<double> cameraAnimation;
  Animation<double> titleAnimation;
  Animation<double> searchAnimation;
  Animation<double> categoryContainerAnimation;
  Animation<double> chatAnimation;
  Animation<double> statusAnimation;
  Animation<double> callAnimation;
  Animation<double> currentItemAnimation;
  HomeAnimation(this._controller)
      : cameraAnimation = offsetTween.animate(CurvedAnimation(
            parent: _controller,
            curve: const Interval(0, .1, curve: Curves.decelerate))),
        titleAnimation = offsetTween.animate(CurvedAnimation(
            parent: _controller,
            curve: const Interval(.1, .3, curve: Curves.decelerate))),
        searchAnimation = offsetTween.animate(CurvedAnimation(
            parent: _controller,
            curve: const Interval(.3, .4, curve: Curves.decelerate))),
        categoryContainerAnimation = baseTween.animate(CurvedAnimation(
            parent: _controller,
            curve: const Interval(.4, .5, curve: Curves.bounceOut))),
        chatAnimation = offsetTween.animate(CurvedAnimation(
            parent: _controller,
            curve: const Interval(.6, .7, curve: Curves.decelerate))),
        statusAnimation = offsetTween.animate(CurvedAnimation(
            parent: _controller,
            curve: const Interval(.7, .8, curve: Curves.decelerate))),
        callAnimation = offsetTween.animate(CurvedAnimation(
            parent: _controller,
            curve: const Interval(.8, .9, curve: Curves.decelerate))),
        currentItemAnimation = baseTween.animate(CurvedAnimation(
            parent: _controller,
            curve: const Interval(.9, 1, curve: Curves.bounceOut)));
}
