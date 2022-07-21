import 'package:flutter/material.dart';
import 'package:log_in/screens/intro_page/intro_page1.dart';
import 'package:log_in/screens/intro_page/intro_page2.dart';
import 'package:log_in/screens/intro_page/intro_page3.dart';
import 'package:log_in/screens/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  //controller to keep track what page we are on
  PageController _controller = PageController();

  //keep track of if we are last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Main Page Viewer
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [
              // 3  main inrtoduction pages
              IntorPage1(),
              IntorPage2(),
              IntorPage3(),
            ],
          ),
          //3 dot indicator
          Container(
            alignment: const Alignment(0, 0.75),
            child: SmoothPageIndicator(controller: _controller, count: 3),
          ),

          // Skip button, onTab will send last intro page
          GestureDetector(
            onTap: () {
              _controller.jumpToPage(2);
            },
            child: Container(
              alignment: const Alignment(0.79, -0.8),
              child: const Text(
                "skip",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          // Next and Done buttons to send next page
          Positioned(
            top: 830,
            left: 20,
            child: onLastPage
                ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: 365,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color(0xFFE3562A)),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Text(
                          "   Done",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                // Next buttons to send next page
                : GestureDetector(
                    onTap: () {
                      _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    child: Container(
                      width: 365,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color(0xFFE3562A)),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Text(
                          "   Next",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
