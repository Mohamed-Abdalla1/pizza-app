import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key,
      required this.controller,
      this.focusNode,
      required this.keyboardType,
      required this.obscureText,
      required this.hintText,
      this.onChanged,
      this.onTap,
      this.validator,
      this.suffixIcon,
      this.prefixIcon,
      this.errorText});
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final bool obscureText;
  final String hintText;
  final Function(String)? onChanged;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? errorText;
  @override
  Widget build(context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: obscureText,
      textInputAction: TextInputAction.next,
      onChanged: onChanged,
      onTap: onTap,
      validator: validator,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          hintText: hintText,
          fillColor: Colors.grey.shade200,
          filled: true,
          errorText: errorText),
    );
  }
}
