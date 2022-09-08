import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class CustomAnimButton extends StatefulWidget {
  const CustomAnimButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final Callback onTap;

  @override
  State<CustomAnimButton> createState() => _CustomAnimButtonState();
}

class _CustomAnimButtonState extends State<CustomAnimButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
      reverseDuration: const Duration(
        milliseconds: 500,
      ),
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

  // void _openCustomDialog() {
  //   showGeneralDialog(
  //       barrierColor: Colors.black.withOpacity(0.5),
  //       transitionBuilder: (context, a1, a2, widget) {
  //         return Transform.scale(
  //           scale: a1.value,
  //           child: Opacity(
  //             opacity: a1.value,
  //             child: AlertDialog(
  //               shape: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(16.0),
  //               ),
  //               content: SizedBox(
  //                 height: MediaQuery.of(context).size.height * 0.7,
  //                 width: MediaQuery.of(context).size.width * 0.7,
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                   children: const [
  //                     Text(
  //                       'its.cinex@gmail.com',
  //                       style: TextStyle(
  //                         color: Colors.black,
  //                         fontSize: 100,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     SocialMediaContacts(
  //                       color: Colors.black,
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         );
  //       },
  //       transitionDuration: const Duration(milliseconds: 200),
  //       barrierDismissible: true,
  //       barrierLabel: '',
  //       context: context,
  //       pageBuilder: (context, animation1, animation2) {
  //         return const Text('data');
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (event) => controller.forward(),
        onExit: (event) => controller.reverse(),
        child: Container(
          height: 70,
          width: 250,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.pink,
              width: 2,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 80 +
                      (250 - 80) *
                          CurvedAnimation(
                            parent: controller,
                            curve: const Interval(
                              0,
                              0.8,
                              curve: Curves.easeInOutCubicEmphasized,
                            ),
                          ).value,
                  height: 70,
                  color: Color.fromARGB(
                      40 +
                          ((255 - 40) *
                                  CurvedAnimation(
                                    parent: controller,
                                    curve: const Interval(
                                      0.8,
                                      1,
                                      curve: Curves.easeOutExpo,
                                    ),
                                  ).value)
                              .ceil(),
                      233,
                      30,
                      98),
                ),
              ),
              SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                      ),
                      child: Text(
                        widget.text,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                      width: 80,
                      child: Center(
                        child: Icon(
                          Icons.code,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
