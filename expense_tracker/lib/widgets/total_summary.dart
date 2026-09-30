import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

// Shows the sum of all registered expenses in one card above the chart.
class TotalSummary extends StatelessWidget {
  const TotalSummary({super.key, required this.expenses});

  final List<Expense> expenses;

  double get _total {
    return expenses.fold(0.0, (sum, expense) => sum + expense.amount);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.account_balance_wallet, color: colors.primary),
                const SizedBox(width: 10),
                Text(
                  'Total spent',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Text(
              currencyFormatter.format(_total),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colors.primary,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}