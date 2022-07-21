import 'package:flutter/material.dart';
import 'package:log_in/screens/login_screen.dart';
import 'package:log_in/screens/splash_screen.dart';
import 'package:log_in/view/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
