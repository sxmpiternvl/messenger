import 'package:flutter/material.dart';
import 'package:messenger/components/myButton.dart';
import 'package:messenger/components/myTextField.dart';
import 'package:messenger/service/auth/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //
  void signIn() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      //
      await authService.signInWithEmailandPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      //
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.message,
                  size: 100,
                ),
                const SizedBox(
                  height: 50,
                ),
                const SizedBox(
                  height: 50,
                ),
                MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false),
                const SizedBox(
                  height: 15,
                ),
                MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true),
                const SizedBox(
                  height: 15,
                ),
                MyButton(onTap: signIn, text: "Sign In"),
                Row(
                  children: [
                    const Text('acc'),
                    GestureDetector(
                        onTap: widget.onTap, child: const Text('in')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
