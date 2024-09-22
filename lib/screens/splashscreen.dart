import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherforecasts/screens/home_screen.dart';
import 'package:weatherforecasts/utilities/common_ui.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
     navigateToHome();
  }

  Future<void> navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGround(
          child: Stack(
        children: [
          Positioned(
           
            child: Lottie.asset("assets/splash.json")),
           const Positioned(
            bottom: 40,
              child: Text(
                  "Weather ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
            ),
               
                  const Positioned(
                    bottom: 9,
                    right: 5,
                    child: Text("Forecasts ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 202, 216, 232),
                          fontSize: 45,
                        )),
                  ),
        ],
      )),
    );
  }
}
