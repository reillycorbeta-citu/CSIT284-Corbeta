import 'package:flutter/material.dart';

import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/utils/app_routes.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setFavorite(Meal meal, bool isFavorite) {
    setState(() {
      if (isFavorite) {
        if (!_favoriteMeals.contains(meal)) _favoriteMeals.add(meal);
      } else {
        _favoriteMeals.remove(meal);
      }
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isFavorite
              ? 'Added "${meal.title}" to favorites.'
              : 'Removed "${meal.title}" from favorites.',
        ),
      ),
    );
  }

  Future<void> _surpriseMe() async {
    final random = (List.of(dummyMeals)..shuffle()).first;
    final result = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: random,
          isFavorite: _favoriteMeals.contains(random),
        ),
      ),
    );

    if (result != null) {
      _setFavorite(random, result);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      favorites: _favoriteMeals,
      onFavoriteChanged: _setFavorite,
    );
    var activePageTitle = 'Pick your category';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeals,
        favorites: _favoriteMeals,
        onFavoriteChanged: _setFavorite,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text('Meal Picker Plus', style: TextStyle(fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text('Meal Stats'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(AppRoutes.stats);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(AppRoutes.about);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: _selectedPageIndex == 0
          ? FloatingActionButton.extended(
              icon: const Icon(Icons.casino),
              label: const Text('Surprise me'),
              onPressed: _surpriseMe,
            )
          : null,
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}