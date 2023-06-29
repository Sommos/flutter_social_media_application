import "package:flutter/material.dart";

class MyPost extends StatelessWidget {
  final String message;
  final String user;
  final String time;

  const MyPost({
    super.key,
    required this.message,
    required this.user,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}