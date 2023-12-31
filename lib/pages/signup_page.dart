import 'package:flutter/material.dart';
import 'package:gradient_icon/gradient_icon.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:together_chat_app/auth/auth_service.dart';

import '../components/my_button.dart';
import '../components/square_tile.dart';
import '../components/text_field.dart';

class SignUpPage extends StatefulWidget {
  final void Function()? onTap;

  const SignUpPage({super.key, this.onTap});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  // sign user up method
  void signUserUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords does not match!'),
        ),
      );
      return;
    }

    //get auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signUpWithEmailPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                // logo
                const GradientIcon(
                  icon: Icons.people_alt,
                  gradient: LinearGradient(
                      colors: [Colors.purple, Colors.green, Colors.blue]),
                  size: 100,
                ),
                const SizedBox(height: 10),

                GradientText(
                  'Together',
                  style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                  ),
                  colors: const [
                    Colors.purple,
                    Colors.green,
                    Colors.blue,
                  ],
                ),
                const SizedBox(height: 10),

                GradientText(
                  'Create your account',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  colors: const [
                    Colors.purple,
                    Colors.green,
                    Colors.blue,
                  ],
                ),
                const SizedBox(height: 30),

                //email text field
                MyTextField(
                  myController: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 20),

                //password text field
                MyTextField(
                  myController: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 20),

                //confirm password text field
                MyTextField(
                  myController: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),

                const SizedBox(height: 15),

                //forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GradientText('Forgot Password?', colors: const [
                        Colors.orange,
                        Colors.pink,
                        Colors.red,
                      ]),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // sign in button
                MyButton(
                  onTap: () => signUserUp,
                  text: 'Sign Up',
                ),

                const SizedBox(height: 25),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.blue[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        child: GradientText('Or continue with', colors: const [
                          Colors.purple,
                          Colors.green,
                          Colors.blue,
                        ]),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.blue[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                //google + facebook + apple sign in buttons
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                      imagePath: 'images/google.png',
                    ),
                    SizedBox(width: 30),
                    SquareTile(
                      imagePath: 'images/apple.png',
                    ),
                  ],
                ),

                const SizedBox(height: 50),

                // register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GradientText(
                      'Already a member? ',
                      colors: const [
                        Colors.indigo,
                        Color.fromARGB(255, 142, 151, 206),
                        Colors.grey,
                      ],
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: widget.onTap,
                      child: GradientText(
                        'Login now',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        colors: const [
                          Colors.blue,
                          Colors.purple,
                          Colors.green,
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
