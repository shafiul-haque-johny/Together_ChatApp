import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:together_chat_app/auth/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // sign user out
  void signOut() {
    // get auth service
    final authService = Provider.of<AuthService>(
      context,
      listen: false,
    );
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page!'),
        actions: [
          // sign out button
          IconButton(
            onPressed: signOut,
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
    );
  }
}
