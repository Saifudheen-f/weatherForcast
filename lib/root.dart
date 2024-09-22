
import 'package:flutter/material.dart';
import 'package:weatherforecasts/screens/splashscreen.dart';
import 'package:weatherforecasts/theme/theme.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home:const SplashScreen()
    );
  }
}
