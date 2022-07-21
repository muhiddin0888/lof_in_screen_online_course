import 'package:flutter/material.dart';

class IntorPage2 extends StatelessWidget {
  const IntorPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/intro2.png"),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Find a course \n      for you",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Quarantine is the perfect time to spend your\nday learning something new, from anywhere!",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
        ],
      )),
    );
  }
}
