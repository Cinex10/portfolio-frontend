// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/Components/hover_widget.dart';
import 'package:portfolio/Models/navigation_item.dart';
import 'package:portfolio/controllers/controller.dart';

class Header extends StatefulWidget {
  const Header({
    Key? key,
    required this.navigationItems,
  }) : super(key: key);

  final List<NavigationItem> navigationItems;
  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  PortfolioController portfolioController = Get.find<PortfolioController>();

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      value: 1,
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOutExpo,
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
    return Container(
      padding: const EdgeInsets.all(
        30,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              // Color.fromARGB(255, 28, 1, 23),
              Colors.black,
              Colors.transparent,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0,
              1,
            ]),
      ),
      child: Row(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  'assets/logo/logo.png',
                  color: Colors.white,
                  height: 40,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              // Container(
              //   height: 30,
              //   width: 2,
              //   decoration: const BoxDecoration(
              //     color: Colors.white,
              //     // shape: BoxShape.circle,
              //   ),
              // ),
              // const SizedBox(
              //   width: 8,
              // ),
              // const Text(
              //   'Cinex',
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontWeight: FontWeight.normal,
              //     fontFamily: 'ProductSans',
              //     fontSize: 50,
              //   ),
              // ),
            ],
          ),
          const Spacer(
            flex: 2,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                widget.navigationItems.length + 2,
                (index) {
                  if (index < widget.navigationItems.length) {
                    return Transform.translate(
                      offset: Offset(300 * (1 - animation.value), 0),
                      child: Opacity(
                        opacity: (animation.value),
                        child: HoverWidget(
                          onTap: widget.navigationItems[index].onTap,
                          // if (ModalRoute.of(context)!.settings.name != '/') {
                          //   Navigator.push(
                          //       context,
                          //       SlideTransitionNav(
                          //           widget: const HomeScreen(),
                          //           offset: const Offset(-1, 0),
                          //           routeName: '/'));
                          // }

                          child: Text(
                            widget.navigationItems[index].label,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    if (index == widget.navigationItems.length) {
                      return Transform.translate(
                        offset: Offset(230 * (1 - animation.value), 0),
                        child: Opacity(
                          opacity: (animation.value),
                          child: ElevatedButton(
                            onPressed: () {
                              window.open(
                                portfolioController.bossInfo.value.resume,
                                'Resume',
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              elevation: 0.0,
                              side: const BorderSide(
                                color: Colors.pink,
                                width: 1,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 17,
                              ),
                            ),
                            child: const Text(
                              'Resume',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return InkWell(
                        onTap: () {
                          if (controller.value == 0) {
                            controller.forward();
                          } else if (controller.value == 1) {
                            controller.reverse();
                          }
                        },
                        child: AnimatedIcon(
                          icon: AnimatedIcons.menu_close,
                          color: Colors.white,
                          size: 30,
                          progress: controller,
                        ),
                      );
                    }
                  }
                },
              ),
              // children: [
              //   Transform.translate(
              //     offset: Offset(680 * (1 - animation.value), 0),
              //     child: HoverWidget(
              //       onTap: () {
              //         if (ModalRoute.of(context)!.settings.name != '/') {
              //           Navigator.push(
              //               context,
              //               SlideTransitionNav(
              //                   widget: const HomeScreen(),
              //                   offset: const Offset(-1, 0),
              //                   routeName: '/'));
              //         }
              //       },
              //       child: const Text(
              //         "INTRO",
              //         style: TextStyle(
              //           fontSize: 15,
              //           color: Colors.white,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //     ),
              //   ),
              //   Transform.translate(
              //     offset: Offset(530 * (1 - animation.value), 0),
              //     child: HoverWidget(
              //       onTap: () {},
              //       child: const Text(
              //         "WHO",
              //         style: TextStyle(
              //           fontSize: 15,
              //           color: Colors.white,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //     ),
              //   ),
              //   Transform.translate(
              //     offset: Offset(380 * (1 - animation.value), 0),
              //     child: HoverWidget(
              //       onTap: () {},
              //       child: const Text(
              //         "WORK",
              //         style: TextStyle(
              //           fontSize: 15,
              //           color: Colors.white,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //     ),
              //   ),

              // ],
            ),
          ),
        ],
      ),
    );
  }
}
