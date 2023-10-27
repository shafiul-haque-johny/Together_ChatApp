import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:together_chat_app/auth/auth_gate.dart';
import 'package:together_chat_app/auth/auth_service.dart';

import 'auth/login_or_signup.dart';
import 'secret/config.dart';

// Web configurations!
final configurations = Configurations();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: configurations.apiKey,
      authDomain: configurations.authDomain,
      projectId: configurations.projectId,
      storageBucket: configurations.storageBucket,
      messagingSenderId: configurations.messagingSenderId,
      appId: configurations.appId,
    ),
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Together ChatApp',
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}
