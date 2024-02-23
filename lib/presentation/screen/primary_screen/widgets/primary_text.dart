import 'package:flutter/material.dart';

class CustomHeading extends StatelessWidget {
  final String heading;
  const CustomHeading({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}

class CustomSubHeading extends StatelessWidget {
  final String subHeading;
  const CustomSubHeading({super.key, required this.subHeading});

  @override
  Widget build(BuildContext context) {
    return Text(
      subHeading,
      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
    );
  }
}