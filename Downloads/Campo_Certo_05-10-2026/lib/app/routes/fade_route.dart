import 'package:flutter/material.dart';

PageRouteBuilder<void> fadeRoute(Widget pagina) {
  return PageRouteBuilder<void>(
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (context, animation, secondaryAnimation) => pagina,
    transitionsBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}