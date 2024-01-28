import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Hello World!"),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app,
                color: Theme.of(context).colorScheme.primary),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ]
      ),
    );
  }
}
