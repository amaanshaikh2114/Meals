import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favourites_provider.dart';
import 'package:meals/providers/filters_provider.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

// ConsumerStatefulWidget being used to showcase the usage of Riverpod which is extended version of StatefulWidget
class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  // final List<Meal> _favouriteMeals = [];
  // Map<Filter, bool> _selectedFilters = kInitialFilters;

  // This fn isn't needed bcz favourite meals are being managed using favourites_provider.dart using Riverpod
  // void _toggleMealFavouriteStatus(Meal meal) {
  //   final isExisting = _favouriteMeals.contains(meal);

  //   if (isExisting) {
  //     setState(() {
  //       _favouriteMeals.remove(meal);
  //       _showinfoMessage('Meal is no longer a favourite!');
  //     });
  //   } else {
  //     setState(() {
  //       _favouriteMeals.add(meal);
  //       _showinfoMessage('Meal marked as favourite!');
  //     });
  //   }
  // }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    if (identifier == 'filters') {
      // Going to the filters page from home page through drawer
      Navigator.of(context).pop();
      // final result = await Navigator.of(context).push<Map<Filter, bool>>(
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(
              // currentFilters: _selectedFilters,
              ),
        ),
      );
      // setState(() {
      //   _selectedFilters = result ?? kInitialFilters;
      // });
    } else {
      // Going back to the home page from home page
      if (_selectedPageIndex == 0) {
        Navigator.of(context).pop();
      } else {
        // Going back to the home page from favourites page
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => const TabsScreen(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Using ref property to access providers and features just like
    // widget.<variable_name> is used to access variables in the above statefulWidget class
    // Use ref.watch() (for continous listening for changed data by setting up a listener)
    //instead of ref.read() (used to read data once)
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(
      // This toggleFavourite function needs to be passed down from
      // TabsScreen ->CategoriesScreen ->MealsScreen->MealItem->MealsdetailsScreen
      // To avoid this we are using Riverpod package - flutter pub add flutter_riverpod
      // onToggleFavourite: _toggleMealFavouriteStatus,
      availableMeals: availableMeals,
    );
    String activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      // favouriteMealsProvider is defined in the favourites_provider.dart
      final favouriteMeals = ref.watch(favouriteMealsProvider);
      activePage = MealsScreen(
        meals: favouriteMeals,
        // onToggleFavourite: _toggleMealFavouriteStatus,
      );
      activePageTitle = 'Your Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
