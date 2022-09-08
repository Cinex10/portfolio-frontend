// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// // ignore: depend_on_referenced_packages
// import 'package:page_transition/page_transition.dart';

// import 'package:portfolio/screens/home_screen.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Image.asset(
//           'assets/background/background.gif',
//           fit: BoxFit.cover,
//         ),
//         AnimatedSplashScreen(
//           pageTransitionType: PageTransitionType.fade,
//           splashTransition: SplashTransition.fadeTransition,
//           backgroundColor: const Color.fromARGB(255, 25, 3, 40),
//           splash: Center(
//             child: SizedBox(
//               height: 80,
//               width: 80,
//               child: Lottie.asset('assets/animations/splash.json'),
//             ),
//           ),
//           nextScreen: const HomeScreen(
//             toSecondScreen: false,
//           ),
//         ),
//       ],
//     );
//   }
// }
