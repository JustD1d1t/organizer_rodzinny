import "package:flutter/material.dart";
import "package:organizer_rodzinny/data/dummy_data.dart";
import 'package:organizer_rodzinny/widgets/finances/charts.dart';

class FinancesScreen extends StatelessWidget {
  const FinancesScreen({super.key});

  static const id = "finances_screen";

  @override
  Widget build(BuildContext context) {
    final budget = availableBudget;

    var content = const Center(
      child: Text("Brak zdefiniowanego budzetu"),
    );

    if (budget["budget"] != null) {
      content = Center(
        child: Column(
          children: [
            FinanceCharts(
              budget: 4000.0,
              spent: 2000.0,
              budgetDetails: budget["categories"],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Finanse"),
      ),
      body: content,
    );
  }
}
