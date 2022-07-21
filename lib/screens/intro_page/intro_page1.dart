import 'package:flutter/material.dart';

class IntorPage1 extends StatelessWidget {
  const IntorPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/intro1.png"),
          //Lottie.asset("assets/lottie/intro1.json", width: 100, height: 100),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Learn anytime \nand anywhere",
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
