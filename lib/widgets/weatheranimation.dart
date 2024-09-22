import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WeatherAnimation extends StatelessWidget {
  const WeatherAnimation({super.key,required this.animation});
  final dynamic animation;
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(animation);
  }
}
