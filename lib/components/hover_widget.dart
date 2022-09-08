import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class HoverWidget extends StatefulWidget {
  const HoverWidget({
    Key? key,
    required this.child,
    required this.onTap,
    this.color,
  }) : super(key: key);

  final Widget child;
  final Callback onTap;
  final Color? color;

  @override
  State<HoverWidget> createState() => _HoverWidgetState();
}

class _HoverWidgetState extends State<HoverWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late ColorTween colorAnimation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 400,
      ),
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOutCirc,
    );
    colorAnimation = ColorTween(
      begin: Colors.white,
      end: Colors.pink,
    );
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
    return MouseRegion(
      onEnter: (event) {
        controller.forward();
      },
      onExit: (event) => controller.reverse(),
      child: Transform.translate(
        offset: Offset(0, -5 * animation.value),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
              colorAnimation.animate(animation).value!, BlendMode.modulate),
          child: InkWell(
            overlayColor: MaterialStateProperty.resolveWith(
              (states) => Colors.transparent,
            ),
            splashColor: Colors.transparent,
            onTap: widget.onTap,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
