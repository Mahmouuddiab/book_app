import 'package:flutter/material.dart';

class CustomAnimatedBuilder extends StatelessWidget {
  const CustomAnimatedBuilder({
    super.key,
    required this.sliderAnimation,
  });

  final Animation<Offset> sliderAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: sliderAnimation,
      builder: (context, _) {
        return SlideTransition(
            position: sliderAnimation,
            child: const Text(
              "Read Books free",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              textAlign: TextAlign.center,
            ));
      },
    );
  }
}
