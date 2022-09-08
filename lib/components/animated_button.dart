import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:lottie/lottie.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({
    Key? key,
    required this.controller,
    required this.onTap,
  }) : super(key: key);
  final AnimationController controller;
  final Callback onTap;
  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    widget.controller.duration = const Duration(
      milliseconds: 2190,
    );
    widget.controller.reverseDuration = const Duration(
      milliseconds: 700,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: LottieBuilder.asset(
        'assets/animations/see_more.json',
        controller: widget.controller,
      ),
    );
  }
}
