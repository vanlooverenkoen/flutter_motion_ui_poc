import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeOut extends StatelessWidget {
  final Widget child;

  const FadeOut({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track('opacity').add(
        Duration(milliseconds: 500),
        Tween(begin: 1.0, end: 0.0),
      ),
    ]);

    return ControlledAnimation(
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation['opacity'],
        child: child,
      ),
    );
  }
}
