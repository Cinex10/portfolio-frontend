import 'dart:math';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:portfolio/Components/header.dart';
import 'package:portfolio/Components/hover_widget.dart';
import 'package:portfolio/Components/slide_transition.dart';
import 'package:portfolio/Models/navigation_item.dart';
import 'package:portfolio/components/background_widget.dart';
import 'package:portfolio/controllers/controller.dart';
import 'package:portfolio/screens/portfolio_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.toSecondScreen,
  }) : super(key: key);

  final bool toSecondScreen;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  PortfolioController portfolioController = Get.find<PortfolioController>();

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1300,
      ),
    );

    if (widget.toSecondScreen) {
      // Future.delayed(const Duration(seconds: 1)).then((value) {
      //   controller.forward();
      //   scrollController.animateTo(
      //     745,
      //     duration: const Duration(
      //       seconds: 1,
      //     ),
      //     curve: Curves.ease,
      //   );
      // });
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.white,
      title: 'Cinex Porfolio',
      child: Scaffold(
        backgroundColor: const Color(0xFF1E0E2E),
        body: Stack(
          children: [
            const BackgroundWidget(),
            Header(
              navigationItems: [
                NavigationItem(
                  label: 'INTRO',
                  onTap: () {
                    portfolioController.scrollController.animateTo(
                      0,
                      duration: const Duration(
                        seconds: 1,
                      ),
                      curve: Curves.ease,
                    );
                  },
                ),
                NavigationItem(
                  label: 'WHO',
                  onTap: () {
                    portfolioController.scrollController.animateTo(
                      1.sh,
                      duration: const Duration(
                        seconds: 1,
                      ),
                      curve: Curves.ease,
                    );
                  },
                ),
                NavigationItem(
                  label: 'WORK',
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
              ],
            ),
            Positioned(
              bottom: 0,
              left: 50,
              child: Column(
                children: [
                  HoverWidget(
                    child: const Icon(
                      FontAwesomeIcons.github,
                      color: Colors.white,
                    ),
                    onTap: () {
                      html.window.open(
                        portfolioController.bossInfo.value.githubUrl,
                        'Github',
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  HoverWidget(
                    child: const Icon(
                      FontAwesomeIcons.instagram,
                      color: Colors.white,
                    ),
                    onTap: () {
                      html.window.open(
                        portfolioController.bossInfo.value.instagramUrl,
                        'Instagram',
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  HoverWidget(
                    child: const Icon(
                      FontAwesomeIcons.linkedin,
                      color: Colors.white,
                    ),
                    onTap: () {
                      html.window.open(
                        portfolioController.bossInfo.value.linkedinUrl,
                        'Linkedin',
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  HoverWidget(
                    child: const Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.white,
                    ),
                    onTap: () {
                      html.window.open(
                        portfolioController.bossInfo.value.facebookUrl,
                        'Facebook',
                      );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 100,
                    width: 1.5,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 50,
              child: Transform.rotate(
                angle: pi / 2,
                alignment: Alignment.centerRight,
                origin: const Offset(-10, 10),
                child: Row(
                  children: [
                    HoverWidget(
                        child: const Text(
                          'its.cinex@gmail.com',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        onTap: () {}),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 100,
                      height: 1.5,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            Obx(() {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                  vertical: 30.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.translate(
                      offset: Offset(
                          0,
                          (1 - portfolioController.backgroundOpacity.value) *
                              -60),
                      child: IconButton(
                        onPressed: () {
                          portfolioController.scrollController.animateTo(
                            0,
                            duration: const Duration(
                              seconds: 1,
                            ),
                            curve: Curves.ease,
                          );
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_up_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset:
                          Offset(0, portfolioController.backgroundOpacity * 60),
                      child: IconButton(
                        onPressed: () {
                          portfolioController.scrollController.animateTo(
                            1.sh,
                            duration: const Duration(
                              seconds: 1,
                            ),
                            curve: Curves.ease,
                          );
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class SocialMediaContacts extends StatelessWidget {
  const SocialMediaContacts({
    Key? key,
    this.color = Colors.white,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          FontAwesomeIcons.facebook,
          color: color ?? Colors.white,
          semanticLabel: 'Facebook',
        ),
        const SizedBox(
          width: 12,
        ),
        Icon(
          FontAwesomeIcons.github,
          color: color ?? Colors.white,
          semanticLabel: 'Github',
        ),
        const SizedBox(
          width: 12,
        ),
        Icon(
          FontAwesomeIcons.instagram,
          color: color ?? Colors.white,
          semanticLabel: 'Instagram',
        ),
        const SizedBox(
          width: 12,
        ),
        Icon(
          FontAwesomeIcons.telegram,
          color: color ?? Colors.white,
          semanticLabel: 'Telegram',
        ),
        const SizedBox(
          width: 12,
        ),
        Icon(
          FontAwesomeIcons.whatsapp,
          color: color ?? Colors.white,
          semanticLabel: 'Whatsapp',
        ),
      ],
    );
  }
}
