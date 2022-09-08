import 'package:flutter/material.dart';

class TitledText extends StatelessWidget {
  const TitledText({
    Key? key,
    required this.texts,
    required this.title,
  }) : super(key: key);

  final String title;
  final List<String> texts;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        texts.length + 1,
        (index) => (index == 0)
            ? Text(
                title,
                style: const TextStyle(
                  color: Colors.white60,
                  height: 2,
                  fontSize: 16,
                ),
              )
            : Text(
                texts[index - 1],
                style: const TextStyle(
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
