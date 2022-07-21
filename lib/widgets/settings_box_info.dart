import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyBoxInfo extends StatelessWidget {
  const MyBoxInfo(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icon});
  final String title;
  final String subTitle;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 363,
      height: 90,
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
              icon,
              width: 45,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: SvgPicture.asset(
              "assets/svg/forward.svg",
              width: 12,
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
