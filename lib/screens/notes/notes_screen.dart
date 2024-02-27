import "package:flutter/material.dart";

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  static const id = "notes_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notatki"),
      ),
      body: const Center(
        child: Text("Notatki"),
      ),
    );
  }
}
