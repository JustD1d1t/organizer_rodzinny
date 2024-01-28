import 'package:flutter/material.dart';

class FinanceChartBar extends StatelessWidget {
  const FinanceChartBar({
    super.key,
    required this.fill,
  });

  final fill;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: DecoratedBox(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8)),
                color: Theme.of(context).colorScheme.secondary),
          ),
        ),
      ),
    );
  }
}
