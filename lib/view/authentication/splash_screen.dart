import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:weatherbreez/core/constants/app_colours.dart';
import 'package:weatherbreez/view/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 4), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  HomeScreen()),
        );
      });
    });

    return Scaffold(
      backgroundColor: AppColours().mainBackGroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInDown(
              preferences: const AnimationPreferences(
                duration: Duration(milliseconds: 1500),
                autoPlay: AnimationPlayStates.Forward,
              ),
              child: Image.asset(
                'assets/weather_Breez_logo-removebg.png',
                width: size.width / 2,
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
