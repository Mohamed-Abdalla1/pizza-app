import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyMacro extends StatelessWidget {
  const MyMacro({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  offset: const Offset(2, 2),
                  blurRadius: 5)
            ]),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              FaIcon(
                FontAwesomeIcons.fire,
                color: Colors.redAccent,
              ),
              SizedBox(height: 4),
              Text(
                "Calories",
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
