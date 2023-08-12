import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedColumn extends StatelessWidget {
  final List<Widget> children;

  const AnimatedColumn({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
        child: Column(
            children: AnimationConfiguration.toStaggeredList(
      duration: const Duration(milliseconds: 250),
      childAnimationBuilder: (widget) => SlideAnimation(
        verticalOffset: 44,
        child: FadeInAnimation(child: widget),
      ),
      children: children,
    )));
  }
}
