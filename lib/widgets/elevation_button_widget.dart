import 'package:flutter/material.dart';

class ElevationbuttonWidget extends StatelessWidget {
  ElevationbuttonWidget({super.key, required this.onTap, required this.text});

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onTap, child: Text(text));
  }
}
