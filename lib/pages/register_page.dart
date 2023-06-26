import "package:flutter/material.dart";

import "../components/my_button.dart";
import "../components/my_text_field.dart";

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

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
                  "Let us register you!",
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

                // confirm password input field
                MyTextField(
                  controller: confirmPasswordTextController, 
                  hintText: "Confirm Password", 
                  obscureText: true,
                ),

                const SizedBox(height: 10.0),

                // login button
                MyButton(onTap: (){}, text: "Sign Up"),

                const SizedBox(height: 10.0),

                // register link text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),

                    const SizedBox(width: 4.0),

                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Login now!", 
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