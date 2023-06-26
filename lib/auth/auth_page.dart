import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

import "../pages/home_page.dart";
import "login_or_register.dart";

class AuthPage extends StatelessWidget {
  const AuthPage
({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in, return home page
          if (snapshot.hasData) {
            return const HomePage();
          // if user is not logged in, return login or register page
          } else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}