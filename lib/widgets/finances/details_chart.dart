import 'package:flutter/material.dart';
import 'package:organizer_rodzinny/widgets/finances/details_chart_bar.dart';

class FinanceDetailsChart extends StatelessWidget {
  const FinanceDetailsChart(
      {super.key, required this.expenses, required this.budget});

  final expenses;
  final double budget;

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final expense in expenses) {
      if (expense["spent"] > maxTotalExpense) {
        maxTotalExpense = expense["spent"];
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final expense in expenses) // alternative to map()
                  FinanceChartBar(
                    fill: expense["spent"] == 0
                        ? 0
                        : expense["spent"] / maxTotalExpense,
                  )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              ...expenses
                  .map(
                    (expense) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Column(
                          children: [
                            Text(
                              expense["name"],
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              expense["spent"].toString(),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ],
          )
        ],
      ),
    );
  }
}
