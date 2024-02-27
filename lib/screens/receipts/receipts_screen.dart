import "package:flutter/material.dart";

class ReceiptsScreen extends StatelessWidget {
  const ReceiptsScreen({super.key});

  static const id = "receipts_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paragon"),
      ),
      body: const Center(
        child: Text("Paragon"),
      ),
    );
  }
}
