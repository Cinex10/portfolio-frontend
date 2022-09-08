import 'package:flutter/cupertino.dart';

class SlideWidgetTransition extends StatefulWidget {
  const SlideWidgetTransition({
    Key? key,
    required this.child,
    required this.begin,
    required this.end,
    this.direction = Direction.fromTop,
  }) : super(key: key);

  final Widget child;
  final double begin;
  final double end;
  final Direction direction;

  @override
  State<SlideWidgetTransition> createState() => _SlideWidgetTransitionState();
}

enum Direction {
  fromTop,
  fromBottom,
}

class _SlideWidgetTransitionState extends State<SlideWidgetTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Interval(
        widget.begin,
        widget.end,
        curve: Curves.easeInOutExpo,
      ),
    );
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(
          0,
          (widget.direction == Direction.fromTop) ? -1 : 0,
        ),
        end: const Offset(0, 0),
      ).animate(animation),
      child: Opacity(
        opacity: animation.value,
        child: widget.child,
      ),
    );
  }
}
