import "package:flutter/material.dart";

class PantryScreen extends StatelessWidget {
  const PantryScreen({super.key});

  static const id = "pantry_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spiżarnia"),
      ),
      body: const Center(
        child: Text("Spiżarnia"),
      ),
    );
  }
}
