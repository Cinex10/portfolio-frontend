import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ScreenShootWidget extends StatelessWidget {
  const ScreenShootWidget({
    Key? key,
    required this.label,
    required this.screenShoot,
    required this.isDeep,
  }) : super(key: key);

  final String label;
  final Image screenShoot;
  final bool isDeep;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 400,
          width: 200,
          margin: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 50,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: screenShoot,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
