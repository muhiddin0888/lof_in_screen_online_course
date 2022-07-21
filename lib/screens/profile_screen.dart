import 'package:flutter/material.dart';
import 'package:log_in/local_data/storage.dart';
import 'package:log_in/screens/login_screen.dart';
import 'package:log_in/screens/navigation_bar.dart';
import 'package:log_in/widgets/profile_box.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return NavBar();
              }));
            },
            child: Image.asset("assets/icons/back.png")),
        title: const Text(
          "Profile",
          style: TextStyle(
              color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/images/Avatar.png",
                width: 272,
              ),
              const SizedBox(
                height: 32,
              ),
              ProfileCard(text: "Your Courses"),
              const SizedBox(
                height: 16,
              ),
              ProfileCard(text: "Saved"),
              const SizedBox(
                height: 16,
              ),
              ProfileCard(text: "Payment"),
              const SizedBox(
                height: 16,
              ),
              TextButton(
                onPressed: () async {
                  await StorageRepository.deleteBool("isLogged");
                  await StorageRepository.deleteString("username");
                  await StorageRepository.deleteString("password");
                  await StorageRepository.deleteString("email");
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const LoginScreen();
                      },
                    ),
                  );
                },
                child: const Text(
                  "Log out",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF78746D)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
