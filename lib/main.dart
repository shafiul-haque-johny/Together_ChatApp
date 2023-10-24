import 'package:flutter/material.dart';

import 'auth/login_or_signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Gradient Login UI',
      debugShowCheckedModeBanner: false,
      home: LoginOrSignup(),
    );
  }
}
