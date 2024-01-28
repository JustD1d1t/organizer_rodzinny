import "package:flutter/material.dart";

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista zakupowa"),
      ),
      body: const Center(
        child: Text("Lista zakupowa"),
      ),
    );
  }
}
