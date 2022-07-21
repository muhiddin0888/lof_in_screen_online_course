import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:log_in/local_data/storage.dart';
import 'package:log_in/screens/navigation_bar.dart';
import 'package:log_in/screens/registration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  String savedUsername = "";
  String savedPassword = "";

  @override
  void initState() {
    getInitials();
    super.initState();
  }

  void getInitials() {
    savedUsername = StorageRepository.getString("username");
    savedPassword = StorageRepository.getString("password");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Center(
          child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/login.png"),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Log in",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Login with social networks",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF78746D)),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset("assets/svg/facebook.svg")),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset("assets/svg/instagram.svg")),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset("assets/svg/google.svg")),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                hintText: "Enter User Name",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                hintText: "Enter Password",
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Forgot Password?",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF78746D)),
            ),
            const SizedBox(height: 10),
            Container(
              width: 343,
              height: 56,
              decoration: BoxDecoration(
                  color: Color(0xFFE3562A),
                  borderRadius: BorderRadius.circular(16)),
              child: TextButton(
                onPressed: () async {
                  String username = usernameController.text;
                  String password = passwordController.text;
                  if (username.length > 3 && password.length >= 6) {
                    if (username == savedUsername &&
                        password == savedPassword) {
                      await StorageRepository.putBool("isLogged", true);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const NavBar();
                      }));
                    } else {
                      //massage
                    }
                  } else {
                    //massege
                  }
                },
                child: const Text(
                  "Log in",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const RegistrationScreen();
                  }));
                },
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF78746D)),
                ))
          ],
        ),
      )),
    );
  }
}
