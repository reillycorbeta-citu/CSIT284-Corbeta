import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:expense_tracker/widgets/total_summary.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Groceries',
      amount: 1250,
      date: DateTime.now().subtract(const Duration(days: 2)),
      category: Category.food,
    ),
    Expense(
      title: 'Cinema Night',
      amount: 350,
      date: DateTime.now().subtract(const Duration(days: 5)),
      category: Category.leisure,
    ),
    Expense(
      title: 'Flutter Course',
      amount: 999,
      date: DateTime.now().subtract(const Duration(days: 12)),
      category: Category.work,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses
        ..add(expense)
        ..sort((a, b) => b.date.compareTo(a.date));
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Text('"${expense.title}" deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            if (!mounted) return;
            setState(() {
              _registeredExpenses.insert(
                expenseIndex.clamp(0, _registeredExpenses.length),
                expense,
              );
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final Widget mainContent = _registeredExpenses.isEmpty
        ? const Center(
            child: Text('No expenses found. Start adding some!'),
          )
        : ExpensesList(
            expenses: _registeredExpenses,
            onRemoveExpense: _removeExpense,
          );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            tooltip: 'Add expense',
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openAddExpenseOverlay,
        icon: const Icon(Icons.add),
        label: const Text('Add expense'),
      ),
      body: Column(
        children: [
          TotalSummary(expenses: _registeredExpenses),
          Expanded(
            child: width < 600
                ? Column(
                    children: [
                      Chart(expenses: _registeredExpenses),
                      Expanded(child: mainContent),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Chart(expenses: _registeredExpenses)),
                      Expanded(child: mainContent),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}