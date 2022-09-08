import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/Components/header.dart';
import 'package:portfolio/Components/slide_transition.dart';
import 'package:portfolio/Models/navigation_item.dart';
import 'package:portfolio/components/painter.dart';
import 'package:portfolio/components/screenshoot_widget.dart';
import 'package:portfolio/components/titled_text.dart';
import 'package:portfolio/models/work_model.dart';
import 'package:portfolio/screens/home_screen.dart';
import 'package:portfolio/screens/portfolio_screen.dart';

class WorkScreen extends StatefulWidget {
  const WorkScreen({
    Key? key,
    required this.work,
  }) : super(key: key);

  final WorkModel work;

  @override
  State<WorkScreen> createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: widget.work.title,
      color: Colors.white,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 28, 1, 23),
        body: CustomPaint(
          painter: Painter(
            n: 0.8 -
                0.5 *
                    (((scrollController.positions.isNotEmpty)
                            ? scrollController.offset
                            : 0) /
                        MediaQuery.of(context).size.height),
            r: 1.25 -
                1.2 *
                    (((scrollController.positions.isNotEmpty)
                            ? scrollController.offset
                            : 0) /
                        MediaQuery.of(context).size.height),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 90,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            widget.work.title,
                                            style: TextStyle(
                                              // color: Colors.white,
                                              foreground: Paint()
                                                ..style = PaintingStyle.stroke
                                                ..strokeWidth = 1
                                                ..color = Colors.white,
                                              fontSize: 70,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  widget.work.description,
                                                  textAlign: TextAlign.justify,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ),
                                              // Spacer(),
                                              Expanded(
                                                // flex: 3,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: TitledText(
                                                        title: 'Date',
                                                        texts: [
                                                          DateFormat.yMMM()
                                                              .format(widget
                                                                  .work.date),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: TitledText(
                                                        title: 'Team',
                                                        texts: [
                                                          widget.work.team,
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: TitledText(
                                                        title: 'Tools',
                                                        texts: [
                                                          widget.work.tools,
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    if (widget.work.psUrl !=
                                                        null)
                                                      Image.asset(
                                                        'assets/logo/google-play-badge.png',
                                                        scale: 3,
                                                      ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    if (widget.work.asUrl !=
                                                        null)
                                                      Image.asset(
                                                        'assets/logo/app-store-badge.png',
                                                        scale: 3,
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Expanded(
                                    flex: 2,
                                    child: Image.network(
                                      widget.work.mainPicture.url,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 30,
                              ),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: IconButton(
                                  onPressed: () {
                                    // controller.forward();
                                    scrollController.animateTo(
                                      745,
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
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 90),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Showcase.',
                                        style: TextStyle(
                                          // color: Colors.white,
                                          foreground: Paint()
                                            ..style = PaintingStyle.stroke
                                            ..strokeWidth = 1
                                            ..color = Colors.white,
                                          fontSize: 70,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 6,
                                        child: Center(
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                widget.work.pictures.length,
                                            itemBuilder: (context, index) =>
                                                ScreenShootWidget(
                                              isDeep: true,
                                              label: widget
                                                  .work.pictures[index].name,
                                              screenShoot: Image.network(
                                                widget.work.pictures[index].url,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Header(
                navigationItems: [
                  NavigationItem(
                    label: 'INTRO',
                    onTap: () {
                      Navigator.push(
                        context,
                        SlideTransitionNav(
                          widget: const HomeScreen(
                            toSecondScreen: false,
                          ),
                          offset: const Offset(1, 0),
                          routeName: '/',
                        ),
                      );
                    },
                  ),
                  NavigationItem(
                    label: 'WHO',
                    onTap: () {
                      Navigator.push(
                        context,
                        SlideTransitionNav(
                          widget: const HomeScreen(
                            toSecondScreen: true,
                          ),
                          offset: const Offset(1, 0),
                          routeName: '/',
                        ),
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
            ],
          ),
        ),
      ),
    );
  }
}
