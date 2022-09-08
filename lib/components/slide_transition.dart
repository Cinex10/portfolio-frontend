import 'package:flutter/cupertino.dart';

class SlideTransitionNav extends PageRouteBuilder {
  final Widget widget;
  final Offset offset;

  SlideTransitionNav({
    required this.widget,
    required this.offset,
    required String routeName,
  }) : super(
          settings: RouteSettings(name: routeName),
          transitionDuration: const Duration(milliseconds: 1000),
          transitionsBuilder: (context, animation, secAnimation, child) {
            animation = CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOutExpo,
            );
            return SlideTransition(
              position: Tween<Offset>(
                end: Offset.zero,
                begin: offset,
              ).animate(animation),
              child: child,
            );
          },
          pageBuilder: (context, animation, secondaryAnimation) {
            return widget;
          },
        );
}
