import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final myController;
  final String hintText;
  final bool obscureText;

  const MyTextField(
      {super.key,
      this.myController,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: TextField(
        controller: myController,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.purple,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green,
            ),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
