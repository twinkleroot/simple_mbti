import 'package:flutter/material.dart';

// Fade 효과를 적용하는 커스텀 PageRoute
class FadePageRoute<T> extends PageRouteBuilder<T> {
  // WidgetBuilder는 Widget Function(BuildContext context) 타입입니다.
  final WidgetBuilder builder;

  FadePageRoute({required this.builder})
      : super(
    transitionDuration: const Duration(milliseconds: 500),
    // pageBuilder에서 전달받은 builder를 사용하여 페이지를 생성합니다.
    pageBuilder: (context, animation, secondaryAnimation) => builder(context),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}