import 'package:flutter/material.dart';

class AnimatedParagraph extends StatefulWidget {
  const AnimatedParagraph({
    Key? key,
    required this.controller,
    required this.children,
    required this.stops,
  }) : super(key: key);

  final AnimationController controller;
  final List<Widget> children;
  final List<double> stops;

  @override
  State<AnimatedParagraph> createState() => _AnimatedParagraphState();
}

class _AnimatedParagraphState extends State<AnimatedParagraph> {
  late List<Animation<double>> animations;
  @override
  void initState() {
    super.initState();
    animations = List.generate(widget.children.length, (index) {
      int i = 0;
      if (index != 0) {
        i = index * 2;
      } else {
        i = index;
      }
      return CurvedAnimation(
        parent: widget.controller,
        curve: Interval(
          widget.stops[i],
          widget.stops[i + 1],
          curve: Curves.ease,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        widget.children.length,
        (index) => FadeTransition(
          opacity: animations[index],
          child: Transform.translate(
            offset: Offset(0, 100 * (1 - animations[index].value)),
            child: widget.children[index],
          ),
        ),
      ),
    );
  }
}
