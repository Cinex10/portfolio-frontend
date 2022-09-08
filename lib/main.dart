import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:portfolio/binding.dart';
import 'package:portfolio/screens/home_screen.dart';

void main() {
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1366, 768),
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            color: Colors.red,
            home: const HomeScreen(
              toSecondScreen: false,
            ),
            theme: ThemeData(
              fontFamily: 'ProductSans',
            ),
            initialBinding: InitBinding(),
          );
        });
  }
}
