import "package:flutter/material.dart";

class MyPost extends StatelessWidget {
  final String message;
  final String user;

  const MyPost({
    super.key,
    required this.message,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
      padding: const EdgeInsets.all(25.0),
      child: Row(
        children: [
          // user avatar
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[400],
            ),
            padding: const EdgeInsets.all(10.0),
            child: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 20.0),
          // messages
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user, 
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500],
                  ),
              ),
              const SizedBox(height: 10.0),
              Text(message),
            ],
          ),
        ],
      ),
    );
  }
}