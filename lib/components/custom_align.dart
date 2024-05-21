import 'package:flutter/material.dart';

class CustomAlign extends StatelessWidget {
  const CustomAlign({
    super.key, required this.height, required this.color, required this.width, required this.alignment,
  });
 final double height;
 final Color color;
  final double width;
 final AlignmentGeometry alignment;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:  alignment,
      child: Container(
        height: height,
        width:width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
