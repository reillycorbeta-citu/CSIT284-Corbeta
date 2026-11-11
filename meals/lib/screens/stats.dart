import 'package:flutter/material.dart';

import 'package:meals/data/dummy_data.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final total = dummyMeals.length;
    final avgDuration =
        dummyMeals.map((m) => m.duration).reduce((a, b) => a + b) / total;
    final quickest =
        dummyMeals.reduce((a, b) => a.duration < b.duration ? a : b);
    final glutenFree = dummyMeals.where((m) => m.isGlutenFree).length;
    final vegan = dummyMeals.where((m) => m.isVegan).length;

    Widget tile(IconData icon, String label, String value) => Card(
          child: ListTile(
            leading: Icon(icon),
            title: Text(label),
            trailing: Text(
              value,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        );

    return Scaffold(
      appBar: AppBar(title: const Text('Meal Stats')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          tile(Icons.restaurant, 'Total meals', '$total'),
          tile(Icons.schedule, 'Average cooking time',
              '${avgDuration.toStringAsFixed(0)} min'),
          tile(Icons.bolt, 'Quickest meal', quickest.title),
          tile(Icons.grain, 'Gluten-free meals', '$glutenFree'),
          tile(Icons.eco, 'Vegan meals', '$vegan'),
        ],
      ),
    );
  }
}