import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlidesPage extends StatelessWidget {
  final String slideTitle;
  final String slideDesc;
  final String slideImg;

  SlidesPage({required this.slideTitle, required this.slideDesc, required this.slideImg});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            slideImg,
            width: width * 0.4,
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            slideTitle,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              slideDesc,
              style: TextStyle(
                height: 1.5,
                fontWeight: FontWeight.normal,
                fontSize: 12,
                letterSpacing: 0.7,
                color: Colors.blue
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
