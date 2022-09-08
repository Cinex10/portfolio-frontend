import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class NavigationButtons extends StatelessWidget {
  const NavigationButtons({
    Key? key,
    required this.onBack,
    required this.onForward,
  }) : super(key: key);

  final Callback onBack;
  final Callback onForward;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 60,
          child: RawMaterialButton(
            onPressed: onBack,
            shape: CircleBorder(
              side: BorderSide(
                color: Colors.deepPurpleAccent.withOpacity(0.5),
                width: 2,
              ),
            ),
            padding: const EdgeInsets.all(16.5),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 12,
            ),
          ),
        ),
        SizedBox(
          width: 60,
          child: RawMaterialButton(
            onPressed: onForward,
            shape: CircleBorder(
              side: BorderSide(
                color: Colors.pink[600]!,
                width: 3,
              ),
            ),
            padding: const EdgeInsets.all(22.5),
            child: const Center(
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
