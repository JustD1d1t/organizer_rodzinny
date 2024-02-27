import "package:flutter/material.dart";

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key});

  static const id = "meals_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posiłki"),
      ),
      body: const Center(
        child: Text("Posiłki"),
      ),
    );
  }
}
