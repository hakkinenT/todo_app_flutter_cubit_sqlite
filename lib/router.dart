import 'package:bloc_studies/modules/app_init/initial_page.dart';
import 'package:bloc_studies/modules/home/home_page.dart';
import 'package:bloc_studies/utils/constants.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialPage:
        return MaterialPageRoute(builder: (_) => const InitialPage());
      case homePage:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomePage(),
            transitionDuration: const Duration(milliseconds: 900),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;

              var tween = Tween(begin: begin, end: end);

              return SlideTransition(
                position: tween.animate(animation),
                child: child,
              );
            });
      default:
        return null;
    }
  }
}
