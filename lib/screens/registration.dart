import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:log_in/local_data/storage.dart';
import 'package:log_in/screens/home_page.dart';
import 'package:log_in/screens/login_screen.dart';
import 'package:log_in/screens/navigation_bar.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return LoginScreen();
              }));
            },
            child: Image.asset("assets/icons/back.png")),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          width: 400,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset("assets/images/singup.png"),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Sign in",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Create your account",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF78746D)),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                hintText: "Name",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                hintText: "Email",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: false,
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                hintText: "Password",
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  if (nameController.text.length > 3 &&
                      passwordController.text.length > 6 &&
                      emailController.text.isNotEmpty) {
                    await StorageRepository.putString(
                        key: "username", value: nameController.text);
                    await StorageRepository.putString(
                        key: "email", value: emailController.text);
                    await StorageRepository.putString(
                        key: "password", value: passwordController.text);
                  }
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return LoginScreen();
                  }));
                },
                child: Text("Sign up"))
          ]),
        ),
      ),
    );
  }
}
