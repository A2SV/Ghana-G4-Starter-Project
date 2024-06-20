
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
enum AnimateType { slideLeft, slideUp, slideDown, slideRight }

class AnimatedColumnWidget extends StatelessWidget {
  final List<Widget> children;
  final AnimateType animateType;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final int duration;
  final double verticalOffset;
  final double horizontalOffset;

  const AnimatedColumnWidget({
    super.key,
    required this.children,
    this.animateType = AnimateType.slideUp,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.duration = 350,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.verticalOffset = 50,
    this.horizontalOffset = 50,
  });

  @override
  Widget build(BuildContext context) {
    if (animateType == AnimateType.slideUp) {
      return AnimationLimiter(
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          mainAxisSize: mainAxisSize,
          children: AnimationConfiguration.toStaggeredList(
            duration: Duration(milliseconds: duration),
            childAnimationBuilder: (widget) => SlideAnimation(
              verticalOffset: verticalOffset,
              child: SlideAnimation(
                child: widget,
              ),
            ),
            children: children,
          ),
        ),
      );
    } else {
      return AnimationLimiter(
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          mainAxisSize: mainAxisSize,
          children: AnimationConfiguration.toStaggeredList(
            duration: Duration(milliseconds: duration),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: horizontalOffset,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
            children: children,
          ),
        ),
      );
    }
  }
}
