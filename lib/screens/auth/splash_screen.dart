import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const id = "splash_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Family organizer"),
      ),
      body: const Center(
        child: Text("Ładowanie..."),
      ),
    );
  }
}
