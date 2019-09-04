import 'package:flutter/material.dart';

class FadeInRoute<T> extends PageRouteBuilder<T> {
  final Widget child;
  final Curve curve;
  final Alignment alignment;
  final Duration duration;

  FadeInRoute({
    Key key,
    @required this.child,
    this.curve = Curves.linear,
    this.alignment,
    this.duration = const Duration(milliseconds: 300),
  }) : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return child;
          },
          transitionDuration: duration,
          transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) =>
              FadeTransition(opacity: animation, child: child),
        );
}
