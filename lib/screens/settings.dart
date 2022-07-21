import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:log_in/local_data/storage.dart';
import 'package:log_in/screens/login_screen.dart';
import 'package:log_in/screens/navigation_bar.dart';
import 'package:log_in/widgets/settings_box_info.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
  });
  // final ValueChanged<bool> onChange;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSwitched = false;

  String savedUsername = "";
  String savedPassword = "";
  String emailPassword = "";
  void getInitials() {
    savedUsername = StorageRepository.getString("username");
    emailPassword = StorageRepository.getString("email");
    savedPassword = StorageRepository.getString("password");
  }

  @override
  void initState() {
    getInitials();
    super.initState();
  }

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
          "Settings",
          style: TextStyle(
              color: Colors.black, fontSize: 26, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: SingleChildScrollView(
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/setting.png",
                  width: 343,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 363,
                  height: 80,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Color(0xFFBEBAB3),
                      ),
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Image.asset(
                          "assets/icons/notification_setting.png",
                          width: 40,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Row(
                            children: [
                              const Text(
                                "Notifications",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            //widget.onChange.call(value);
                            print(isSwitched);
                          });
                        },
                        activeTrackColor: Color.fromARGB(255, 113, 201, 183),
                        activeColor: Color(0xFF5BA092),
                      ),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Account information",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 16,
                ),
                MyBoxInfo(
                    title: "Name",
                    subTitle: savedUsername,
                    icon: "assets/icons/person.png"),
                const SizedBox(
                  height: 16,
                ),
                MyBoxInfo(
                    title: "Email",
                    subTitle: emailPassword,
                    icon: "assets/icons/email.png"),
                const SizedBox(
                  height: 16,
                ),
                MyBoxInfo(
                    title: "Name",
                    subTitle: savedPassword,
                    icon: "assets/icons/security.png"),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: 363,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xFFE3562A)),
                  child: TextButton(
                    onPressed: () async {
                      await StorageRepository.deleteBool("isLogged");
                      await StorageRepository.deleteString("username");
                      await StorageRepository.deleteString("password");
                      await StorageRepository.deleteString("email");
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return LoginScreen();
                      }));
                    },
                    child: const Text(
                      "Log out",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
