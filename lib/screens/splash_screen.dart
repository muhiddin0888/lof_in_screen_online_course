import 'dart:async';
import 'package:flutter/material.dart';
import 'package:log_in/local_data/storage.dart';
import 'package:log_in/screens/home_page.dart';
import 'package:log_in/screens/login_screen.dart';
import 'package:log_in/screens/navigation_bar.dart';
import 'package:log_in/screens/onboarding_screen.dart';
import 'package:log_in/services/shared_preference.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<void> checkState() async {
    await Future.delayed(const Duration(seconds: 3));
    await StorageRepository.getInstance();
    var isLogged = StorageRepository.getBool("isLogged");
    print(isLogged);
    if (isLogged) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return NavBar();
      }));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return OnBoardingScreen();
      }));
    }
  }

  @override
  void initState() {
    checkState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/splash.png",
                width: 495,
                height: 324,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "CodeFactory",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
              )
            ]),
      ),
    );
  }
}
