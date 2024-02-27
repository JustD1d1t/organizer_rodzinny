import "package:flutter/material.dart";

class ListsScreen extends StatelessWidget {
  const ListsScreen({super.key});

  static const id = "lists_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listy"),
      ),
      body: const Center(
        child: Text("Listy"),
      ),
    );
  }
}
