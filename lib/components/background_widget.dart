import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/intro_widget.dart';
import 'package:portfolio/components/who_widget.dart';
import 'package:portfolio/controllers/controller.dart';

class BackgroundWidget extends GetView<PortfolioController> {
  final duration = const Duration(
    seconds: 1,
  );

  const BackgroundWidget({Key? key}) : super(key: key);

  _onStartScroll(ScrollMetrics metrics) {
    // if you need to do something at the start
  }

  _onUpdateScroll(ScrollMetrics metrics) {
    // do your magic here to change the value

    controller.backgroundOpacity.value = metrics.pixels / 1.sh;
  }

  _onEndScroll(ScrollMetrics metrics) {
    // do your magic here to return the value to normal
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          // ShaderMask(
          //   shaderCallback: (rectangle) {
          //     return const LinearGradient(
          //       colors: [
          //         Color(0xFF000000),
          //         Colors.transparent,
          //         Color(0xFF000000),
          //         // Color(0xFF1E0E2E),
          //       ],
          //       begin: Alignment.centerLeft,
          //       end: Alignment.centerRight,
          //     ).createShader(
          //       Rect.fromLTRB(
          //         rectangle.width,
          //         rectangle.height,
          //         0,
          //         0,
          //       ),
          //     );
          //   },
          //   blendMode: BlendMode.dstOut,
          //   child: Opacity(
          //     opacity: 0.67 * (1 - controller.backgroundOpacity.value),
          //     child: Transform.scale(
          //       scale: (controller.scrollController.positions.isEmpty)
          //           ? 1
          //           : 1 + controller.scrollController.position.pixels / 3000,
          //       alignment: Alignment.topCenter,
          //       child: SizedBox(
          //         height: MediaQuery.of(context).size.height,
          //         width: MediaQuery.of(context).size.width,
          //         child: Image.asset(
          //           'assets/background/background.gif',
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

          Opacity(
            opacity: controller.backgroundOpacity.value,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ShaderMask(
                shaderCallback: (rectangle) {
                  return const LinearGradient(
                    colors: [
                      Color.fromARGB(100, 203, 3, 87),
                      Color.fromARGB(100, 30, 14, 46),
                    ],
                  ).createShader(
                    Rect.fromLTRB(
                      rectangle.width,
                      rectangle.height,
                      0,
                      0,
                    ),
                  );
                },
                blendMode: BlendMode.modulate,
                child: Image.asset(
                  'assets/background/personal_image.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollStartNotification) {
                _onStartScroll(scrollNotification.metrics);
              } else if (scrollNotification is ScrollUpdateNotification) {
                _onUpdateScroll(scrollNotification.metrics);
              } else if (scrollNotification is ScrollEndNotification) {
                _onEndScroll(scrollNotification.metrics);
              }
              return true; // see docs
            },
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller.scrollController,
              children: widgets,
            ),
          ),
        ],
      );
    });
  }
}

const List<Widget> widgets = [
  IntroWidget(),
  WhoWidget(),
];
