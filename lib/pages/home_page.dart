import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

import "../components/my_text_field.dart";
import "../components/my_post.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final textController = TextEditingController();

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  void postMessage() {
    if (textController.text.isNotEmpty) {
      // store message in firestore
      FirebaseFirestore.instance.collection('User Posts').add({
        'UserEmail': currentUser.email,
        'Message': textController.text,
        'TimeStamp': Timestamp.now(),
      });
    }
    // clear text field
    setState(() {
      textController.clear();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text("Sendeloa"),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            // messages
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                  .collection("User Posts")
                  .orderBy("TimeStamp", descending: false)
                  .snapshots(),
                builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        // get message
                        final post = snapshot.data!.docs[index];
                        return MyPost(
                          message: post['Message'], 
                          user: post['UserEmail'], 
                        )
                      }
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error}"),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            // post message
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  Expanded(
                    child: MyTextField(
                      controller: textController,
                      hintText: "Enter message",
                      obscureText: false,
                    ),
                  ),
                  IconButton(
                    onPressed: postMessage,
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
            // logged in as
            Text(
              "Logged in as ${currentUser.email!}", 
              style: const TextStyle(color: Colors.grey)
            ),

            const SizedBox(height: 50.0,),
          ],
        ),
      ),
    );
  }
}