import 'package:flutter/material.dart';
import 'package:messenger/service/auth/auth_service.dart';
import 'package:provider/provider.dart';

import '../components/myButton.dart';
import '../components/myTextField.dart';

class RegistrationPage extends StatefulWidget {
  final void Function()? onTap;
  const RegistrationPage({super.key, this.onTap});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  //
  void signUp() async {
    if (confirmPasswordController.text != passwordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Passwords do not match'),
      ));
      return;
    }
    final authServie = Provider.of<AuthService>(context, listen: false);
    try {
      await authServie.signUpWithEmailandPassword(
          emailController.text, passwordController.text);
    } catch (e) {
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
                MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm password',
                    obscureText: true),
                const SizedBox(
                  height: 15,
                ),
                MyButton(onTap: signUp, text: "Sign Up"),
                Row(
                  children: [
                    Text('qwe'),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(onTap: widget.onTap, child: Text('up'))
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
