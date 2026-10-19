import 'package:flutter/material.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late bool _glutenFree;
  late bool _lactoseFree;
  late bool _vegetarian;
  late bool _vegan;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFree = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarian = widget.currentFilters[Filter.vegetarian]!;
    _vegan = widget.currentFilters[Filter.vegan]!;
  }

  Widget _switch(String title, String subtitle, bool value,
      void Function(bool) onChanged) {
    return SwitchListTile(
      value: value,
      onChanged: (v) => setState(() => onChanged(v)),
      title: Text(title, style: Theme.of(context).textTheme.titleLarge),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.labelMedium),
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFree,
            Filter.lactoseFree: _lactoseFree,
            Filter.vegetarian: _vegetarian,
            Filter.vegan: _vegan,
          });
        },
        child: Column(
          children: [
            _switch('Gluten-free', 'Only include gluten-free meals.',
                _glutenFree, (v) => _glutenFree = v),
            _switch('Lactose-free', 'Only include lactose-free meals.',
                _lactoseFree, (v) => _lactoseFree = v),
            _switch('Vegetarian', 'Only include vegetarian meals.',
                _vegetarian, (v) => _vegetarian = v),
            _switch('Vegan', 'Only include vegan meals.', _vegan,
                (v) => _vegan = v),
          ],
        ),
      ),
    );
  }
}