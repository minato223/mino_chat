import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<Object?> pushRoute(Widget widget, {bool? replacement}) async {
    Route<Object> route = PageRouteBuilder(
      pageBuilder: ((context, animation, secondaryAnimation) {
        return widget;
      }),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final Animatable<Offset> tween =
            Tween(begin: const Offset(1, 0), end: Offset.zero)
                .chain(CurveTween(curve: Curves.linearToEaseOut));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
    if (replacement == true) {
      return Navigator.of(this).pushReplacement(route);
    }
    return Navigator.of(this).push(route);
  }
}
