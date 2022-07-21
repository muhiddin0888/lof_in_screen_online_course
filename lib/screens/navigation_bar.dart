import 'package:flutter/material.dart';
import 'package:log_in/local_data/storage.dart';
import 'package:log_in/screens/home_page.dart';
import 'package:log_in/screens/profile_screen.dart';
import 'package:log_in/screens/settings.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool themeState = false;
  Future<void> _init() async {
    await StorageRepository.getInstance();
    themeState = StorageRepository.getBool("theme_state");
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  int currentnum = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentnum],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentnum = index;
          });
        },
        currentIndex: currentnum,
        selectedItemColor: Colors.red,
        iconSize: 28,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Course"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
