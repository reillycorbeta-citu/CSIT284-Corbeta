import 'package:flutter/material.dart';

import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.favorites,
    required this.onFavoriteChanged,
  });

  final String? title;
  final List<Meal> meals;
  final List<Meal> favorites;
  final void Function(Meal meal, bool isFavorite) onFavoriteChanged;

  Future<void> selectMeal(BuildContext context, Meal meal) async {
    final result = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
          isFavorite: favorites.contains(meal),
        ),
      ),
    );

    if (result != null) {
      onFavoriteChanged(meal, result);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Text(
        'Nothing here... try selecting a different category!',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectMeal: (meal) => selectMeal(context, meal),
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: content,
    );
  }
}