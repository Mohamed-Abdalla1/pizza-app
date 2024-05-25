import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyMacro extends StatelessWidget {
  const MyMacro(
      {super.key,
      required this.icon,
      required this.title,
      required this.value});
  final IconData icon;
  final String title;
  final int value;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                offset: const Offset(2, 2),
                blurRadius: 5)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            FaIcon(
              icon,
              color: Colors.redAccent,
            ),
            const SizedBox(height: 4),
            Text(
              "$value $title",
              style: const TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}
