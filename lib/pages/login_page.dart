import "package:flutter/material.dart";

import '/components/my_text_field.dart';
import '/components/my_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // lock icon
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
          
                const SizedBox(height: 50.0),

                // welcome back text
                Text(
                  "Welcome back, you have been missed!",
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
          
                const SizedBox(height: 25.0),

                // email input field
                MyTextField(
                  controller: emailTextController, 
                  hintText: "Email", 
                  obscureText: false,
                ),

                const SizedBox(height: 10.0),

                // password input field
                MyTextField(
                  controller: passwordTextController, 
                  hintText: "Password", 
                  obscureText: true,
                ),

                const SizedBox(height: 10.0),

                // login button
                MyButton(onTap: (){}, text: "Login"),

                const SizedBox(height: 10.0),

                // register link text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member?",
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),

                    const SizedBox(width: 4.0),

                    GestureDetector(
                      onTap: (){},
                      child: const Text(
                        "Register now!", 
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan,
                        ),
                      ),
                    ),
                  ],
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}