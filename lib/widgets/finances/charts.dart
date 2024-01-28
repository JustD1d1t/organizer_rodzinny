import "package:flutter/material.dart";
import "package:organizer_rodzinny/widgets/finances/details_chart.dart";

class FinanceCharts extends StatelessWidget {
  const FinanceCharts({
    super.key,
    required this.budget,
    required this.spent,
    required this.budgetDetails,
  });

  final spent;
  final budget;
  final budgetDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text("Pozostały budżet"),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: spent / budget,
            minHeight: 40,
            borderRadius: BorderRadius.circular(10),
            semanticsLabel: "Pozostały budżet",
          ),
          if (budgetDetails.isNotEmpty)
            FinanceDetailsChart(expenses: budgetDetails, budget: budget),
        ],
      ),
    );
  }
}
