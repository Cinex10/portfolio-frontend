import 'dart:ui';

import 'package:flutter/material.dart';

class OverlayTransiion extends StatefulWidget {
  const OverlayTransiion({Key? key, required this.controller})
      : super(key: key);

  final AnimationController controller;

  @override
  State<OverlayTransiion> createState() => _OverlayTransiionState();
}

class _OverlayTransiionState extends State<OverlayTransiion>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;

  double screenHeight =
      (window.physicalSize.shortestSide / window.devicePixelRatio);
  @override
  void initState() {
    super.initState();

    animation3 = Tween<double>(
      begin: screenHeight,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: const Interval(
          0.0,
          0.8,
          curve: Curves.easeInOutQuint,
        ),
      ),
    );
    animation1 = Tween<double>(
      begin: screenHeight,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: const Interval(
          0.2,
          0.9,
          curve: Curves.easeInOutQuint,
        ),
      ),
    );
    animation2 = Tween<double>(begin: screenHeight, end: 0).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: const Interval(
          0.6,
          1.0,
          curve: Curves.easeInOutQuint,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: Offset(0, animation3.value),
          child: Container(
            // duration: const Duration(seconds: 1),
            height: animation2.value,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(100, 176, 5, 82),
          ),
        ),
        Transform.translate(
          offset: Offset(0, animation1.value),
          child: Container(
            height: animation2.value,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 176, 5, 82),
          ),
        ),
      ],
    );
  }
}
