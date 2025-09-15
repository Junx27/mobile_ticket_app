import 'package:flutter/material.dart';

class SlidePageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  final Offset begin;
  final Duration duration;

  SlidePageRoute({
    required this.page,
    this.begin = const Offset(1.0, 0.0),
    this.duration = const Duration(milliseconds: 500),
  }) : super(
         pageBuilder: (_, __, ___) => page,
         transitionDuration: duration,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           var tween = Tween(
             begin: begin,
             end: Offset.zero,
           ).chain(CurveTween(curve: Curves.easeInOut));
           return SlideTransition(
             position: animation.drive(tween),
             child: child,
           );
         },
       );
}
