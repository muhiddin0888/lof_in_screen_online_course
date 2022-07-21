import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:log_in/local_data/storage.dart';
import 'package:log_in/widgets/category_box.dart';
import 'package:log_in/widgets/text_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController nameController = TextEditingController();
  String savedUsername = "";
  void getInitials() {
    savedUsername = StorageRepository.getString("username");
  }

  @override
  void initState() {
    getInitials();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Hello,",
                          style: TextStyle(fontSize: 22),
                        ),
                        Text(
                          savedUsername,
                          style: const TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/icons/notification.png",
                    width: 60,
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                  hintText: "Search course",
                  suffix: SvgPicture.asset(
                    "assets/svg/search.svg",
                    width: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  const Text(
                    "Category:",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF3C3A36)),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 10,
                          ),
                          CategoryWidget(text: "#CSS"),
                          SizedBox(
                            width: 15,
                          ),
                          CategoryWidget(text: "#UX"),
                          SizedBox(
                            width: 15,
                          ),
                          CategoryWidget(text: "#Swift"),
                          SizedBox(
                            width: 15,
                          ),
                          CategoryWidget(text: "#UI"),
                          SizedBox(
                            width: 15,
                          ),
                          CategoryWidget(text: "#UI"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      CategoryCard(
                          color: Color(0xFFF8F2EE),
                          images: "assets/images/UI.png",
                          time: "3 h 30 min ",
                          title: "UI",
                          subtitel: "Advanced mobile interface design"),
                      SizedBox(
                        height: 20,
                      ),
                      CategoryCard(
                          color: Color(0xFFE6EDF4),
                          images: "assets/images/UI2.png",
                          time: "3 h 30 min ",
                          title: "UX",
                          subtitel: "Advanced mobile interface design"),
                      SizedBox(
                        height: 20,
                      ),
                      CategoryCard(
                          color: Color(0xFFF8F2EE),
                          images: "assets/images/UI3.png",
                          time: "3 h 30 min ",
                          title: "UX",
                          subtitel: "Advanced mobile interface design"),
                    ],
                  ),
                ),
              ),

              // ElevatedButton(
              //   onPressed: () async {
              //     await StorageRepository.deleteBool("isLogged");
              //     await StorageRepository.deleteString("username");
              //     await StorageRepository.deleteString("password");
              //     await StorageRepository.deleteString("email");
              //   },
              //   child: Text("Log out"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
