import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/animated_paragraph.dart';
import 'package:portfolio/components/titled_text.dart';
import 'package:portfolio/controllers/controller.dart';

class WhoWidget extends StatefulWidget {
  const WhoWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<WhoWidget> createState() => _WhoWidgetState();
}

class _WhoWidgetState extends State<WhoWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOutCirc,
    );
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  final PortfolioController portfolioController =
      Get.find<PortfolioController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      margin: EdgeInsets.symmetric(
        horizontal: 0.2.sw,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Text(
            "WHO",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Transform(
            transform: Matrix4.skewY(-0.2),
            child: Container(
              width: 24 * animation.value,
              height: 7,
              color: Colors.pink,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(() {
            return AnimatedParagraph(
              controller: controller,
              stops: const [
                0,
                0.5,
                0.2,
                0.7,
                0.4,
                0.9,
                0.6,
                1,
              ],
              children: [
                const Text(
                  'Create the opportunity.',
                  style: TextStyle(
                    height: 1.2,
                    fontSize: 40,
                    color: Colors.white,
                    fontFamily: 'ProductSans',
                    // fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${portfolioController.bossInfo.value.bio}\n",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white70,
                    fontFamily: 'ProductSans',
                    // fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitledText(
                      title: 'Skills',
                      texts: portfolioController.bossInfo.value.skills,
                    ),
                    TitledText(
                      title: 'Software & Tools',
                      texts: portfolioController.bossInfo.value.tools,
                    ),
                    TitledText(
                      title: 'Interests',
                      texts: portfolioController.bossInfo.value.interests,
                    ),
                  ],
                ),
              ],
            );
          }),
          const Spacer(),
          const Text(
            'Made with ❤️ by Yassine DRISS, 2022',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w100,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
