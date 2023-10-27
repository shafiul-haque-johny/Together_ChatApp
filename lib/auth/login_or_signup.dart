import 'package:flutter/material.dart';
import 'package:together_chat_app/pages/login_page.dart';
import 'package:together_chat_app/pages/signup_page.dart';

class LoginOrSignup extends StatefulWidget {
  const LoginOrSignup({Key? key}) : super(key: key);

  @override
  State<LoginOrSignup> createState() => _LoginOrSignupState();
}

class _LoginOrSignupState extends State<LoginOrSignup> {
  //initially show the login page
  bool showLoginPage = true;

  // toggle between login or signup page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LogInPage(
        onTap: togglePages,
      );
    } else {
      return SignUpPage(
        onTap: togglePages,
      );
    }
  }
}
