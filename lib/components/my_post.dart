import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

import "like_button.dart";

class MyPost extends StatefulWidget {
  final String message;
  final String user;
  final String postId;
  final List<String> likes;

  const MyPost({
    super.key,
    required this.message,
    required this.user,
    required this.postId,
    required this.likes,
  });

  @override
  State<MyPost> createState() => _MyPostState();
}

class _MyPostState extends State<MyPost> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    isLiked = widget.likes.contains(currentUser.email);
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

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
          // like button
          Column(
            children: [
              LikeButton(isLiked: false, onTap: () {}),
            ],
          ),
          const SizedBox(width: 20.0),
          // messages
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.user, 
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500],
                  ),
              ),
              const SizedBox(height: 10.0),
              Text(widget.message),
            ],
          ),
        ],
      ),
    );
  }
}