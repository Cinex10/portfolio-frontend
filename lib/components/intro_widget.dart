import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/components/custom_anim_button.dart';
import 'package:portfolio/components/slide_transition.dart';
import 'package:portfolio/screens/portfolio_screen.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          flex: 3,
                          child: Text(
                            'Hi, my name is',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w200,
                              wordSpacing: 5,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 8,
                          child: Text(
                            'Driss Yassine.',
                            style: TextStyle(
                              // height: 0.6,
                              fontSize: 72,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: RichText(
                            text: TextSpan(
                                text: 'I build',
                                style: const TextStyle(
                                  fontFamily: 'ProductSans',
                                  textBaseline: TextBaseline.ideographic,
                                  fontSize: 72,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white60,
                                ),
                                children: [
                                  TextSpan(
                                    text: ' things ',
                                    style: TextStyle(
                                      textBaseline: TextBaseline.ideographic,
                                      fontSize: 72,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 1
                                        ..color = Colors.white60,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: 'for mobile.',
                                  ),
                                ]),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        // Spacer(),
                        CustomAnimButton(
                          text: 'SEE WORK',
                          onTap: () {
                            Navigator.push(
                              context,
                              SlideTransitionNav(
                                widget: const PortfolioScreen(),
                                offset: const Offset(1, 0),
                                routeName: '/portfolio',
                              ),
                            );
                          },
                        ),
                        // Spacer(),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              DateTime.now().month.toString().padLeft(2, '0'),
                              style: const TextStyle(
                                // height: 0.7,
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              height: 4,
                              // width: 60,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '/ ${DateTime.now().day.toString().padLeft(2, '0')}',
                          style: const TextStyle(
                            color: Colors.pink,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
