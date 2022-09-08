import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/navigation_buttons.dart';
import 'package:portfolio/components/work_card.dart';
import 'package:portfolio/controllers/controller.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final controller = Get.find<PortfolioController>();

  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'My Works',
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background/background.gif'),
                fit: BoxFit.cover,
                opacity: 0.67),
          ),
          child: Stack(
            children: [
              Obx(() {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.topCenter,
                      radius: 1,
                      // focalRadius: 1,
                      // focal: Alignment.center,
                      colors: [
                        Color.fromARGB(
                            (controller.hovers.contains(true)) ? 100 : 255,
                            66,
                            25,
                            93),
                        const Color.fromARGB(255, 33, 17, 48),
                      ],
                    ),
                  ),
                );
              }),
              Row(
                children: [
                  Container(
                    color: const Color(0xFF1E0E2E),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 6,
                    child: Center(
                      child: NavigationButtons(
                        onBack: () {
                          double scrollOffset = scrollController.offset;
                          if (scrollOffset != 0) {
                            scrollOffset -=
                                MediaQuery.of(context).size.width / 4.5;
                            scrollController.animateTo(
                              scrollOffset,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOutCirc,
                            );
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        onForward: () {
                          double scrollOffset = scrollController.offset +
                              MediaQuery.of(context).size.width / 4.5;
                          scrollController.animateTo(
                            scrollOffset,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOutCirc,
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Obx(() {
                      return ListView.separated(
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.works.length,
                        separatorBuilder: (context, index) =>
                            const VerticalDivider(
                          color: Color.fromARGB(255, 40, 20, 61),
                          width: 1,
                        ),
                        itemBuilder: (context, index) => WorkCard(
                          index: index,
                          work: controller.works[index],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
