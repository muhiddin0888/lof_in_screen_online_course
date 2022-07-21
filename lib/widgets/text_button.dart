import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 64,
      decoration: BoxDecoration(
          color: Color(0xFF65AAEA), borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
