import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 363,
      height: 80,
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Color(0xFFBEBAB3),
          ),
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Text(
          text,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
