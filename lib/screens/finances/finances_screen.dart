import "package:flutter/material.dart";

class FinancesScreen extends StatelessWidget {
  const FinancesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Finanse"),
      ),
      body: const Center(
        child: Text("Finanse"),
      ),
    );
  }
}
