import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/animated_button.dart';
import 'package:portfolio/components/circular_progress_painter.dart';
import 'package:portfolio/components/slide_transition.dart';
import 'package:portfolio/controllers/controller.dart';
import 'package:portfolio/models/work_model.dart';
import 'package:portfolio/screens/work_screen.dart';

class WorkCard extends StatefulWidget {
  const WorkCard({
    Key? key,
    required this.index,
    required this.work,
  }) : super(key: key);
  final int index;
  final WorkModel work;

  @override
  State<WorkCard> createState() => _WorkCardState();
}

class _WorkCardState extends State<WorkCard>
    with SingleTickerProviderStateMixin {
  bool isHover = false;
  late AnimationController controller;
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<Color?> animation3;

  PortfolioController hoverController = Get.find<PortfolioController>();

  late DateTime enteredTime;

  @override
  void initState() {
    super.initState();
    enteredTime = DateTime.now();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
      reverseDuration: const Duration(milliseconds: 200),
    );
    animation1 = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutExpo,
    );
    ColorTween colorTween = ColorTween(
      begin: Colors.white30,
      end: Colors.pink,
    );
    animation3 = colorTween.animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0,
          0.3,
          curve: Curves.easeOutExpo,
        ),
      ),
    );
    animation2 = CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0,
          0.6,
          curve: Curves.easeInOutCubicEmphasized,
        ));
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() {
        hoverController.activateHover(widget.index);
        controller.forward();
      }),
      onExit: (event) => setState(() {
        hoverController.disableHover();
        controller.reverse();
        // animatorState.stop();
        isHover = false;
      }),
      onHover: (event) {
        if (enteredTime.difference(DateTime.now()).abs().inSeconds > 2) {
          setState(() {
            isHover = true;
          });
        }
      },
      child: Stack(
        children: [
          Obx(() {
            return Visibility(
              visible: (hoverController.hovers[widget.index]),
              child: Opacity(
                opacity: (1 - controller.value),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width / 4.5,
                  color: const Color(0xFF1E0E2E),
                ),
              ),
            );
          }),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 4.5,
            child: Padding(
              padding: const EdgeInsets.all(48.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.index}'.padLeft(2, '0'),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Divider(
                    endIndent: 230 + (-40 * animation1.value),
                    color: animation3.value,
                    thickness: 2.7,
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color.fromARGB(60, 233, 30, 162),
                      ),
                    ),
                    child: CustomPaint(
                      painter: CircularProgressPainter(
                          value: (1 - animation2.value / 2),
                          color: Colors.pink),
                      child: const Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      widget.work.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 12,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Transform(
                          transform: Matrix4.identity()
                            ..setEntry(2, 2, 0.01)
                            ..rotateX(-2 * animation2.value),
                          child: const Opacity(
                            opacity: (1),
                            child: Text(
                              'READ MORE',
                              style: TextStyle(
                                fontSize: 11,
                                letterSpacing: 3,
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 30,
                          child: Column(
                            children: [
                              Transform.scale(
                                scaleY: 1.3 - animation2.value * 0.3,
                                alignment: Alignment.topCenter,
                                child: Transform.translate(
                                  offset: Offset(0, -20 * animation2.value),
                                  child: FadeTransition(
                                    opacity: animation2,
                                    child: SizedBox(
                                      width: 250,
                                      child: StructuredText(
                                        text: widget.work.briefDescription,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4.5,
                    child: AnimatedButton(
                      controller: controller,
                      onTap: () {
                        Navigator.push(
                          context,
                          SlideTransitionNav(
                              widget: WorkScreen(
                                work: widget.work,
                              ),
                              offset: const Offset(0, -1),
                              routeName: '/work'),
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StructuredText extends StatelessWidget {
  const StructuredText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text.split('\n-').first,
          maxLines: 6,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 14,
            height: 1.4,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        EnumeratedParagraph(
          bullColor: Colors.pink,
          texts: List.generate(
            text.split('\n-').length - 1,
            (index) => text.split('\n-')[index + 1],
          ),
        ),
      ],
    );
  }
}

class EnumeratedParagraph extends StatelessWidget {
  const EnumeratedParagraph({
    Key? key,
    required this.texts,
    required this.bullColor,
  }) : super(key: key);

  final List<String> texts;
  final Color bullColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        texts.length,
        (index) => Row(
          children: [
            Icon(
              Icons.circle,
              color: bullColor,
              size: 8,
            ),
            Text(
              texts[index],
              style: const TextStyle(
                fontSize: 14,
                height: 1.4,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
