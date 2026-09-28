import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

// Categories an expense can belong to.
enum Category { food, travel, leisure, work, health }

// Maps each category to an icon so the UI can render it consistently
// wherever a category shows up (list items, chart, dropdown).
const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie_creation,
  Category.work: Icons.work,
  Category.health: Icons.favorite,
};

// Personalization: a display label nicer than the raw enum name.
const categoryLabels = {
  Category.food: 'Food',
  Category.travel: 'Travel',
  Category.leisure: 'Leisure',
  Category.work: 'Work',
  Category.health: 'Health',
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

// Helper class that groups expenses by category so the Chart widget
// can display one bar per category with its total amount.
class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  // Builds a bucket for a single category out of the full expense list.
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
