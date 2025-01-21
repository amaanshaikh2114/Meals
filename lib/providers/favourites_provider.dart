import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

// StateNotifier class is used along with StateNotifierProvider
class FavouritesMealsNotifier extends StateNotifier<List<Meal>> {
  // Updation in existing objects in memory isn't allowed by this package. We have to create a
  // new object everytime (new memory space with same variableName) the object has to be updated
  // with a new value, thus updating existing objects in memory by reassignment is done rather than
  // editing the state of the same object (thus fns like add(), remove can't be used)
  FavouritesMealsNotifier() : super([]); // state is a list here

  bool toggleMealFavouriteStatus(Meal meal) {
    // Checks if meal is favourite or not in the state list
    final mealIsFavourite = state.contains(meal);
    if (mealIsFavourite) {
      // Checks for every meal item if it's id != favourite meal id (m.id != meal.id),
      // if condition isn't satisfied then it returns true for that condition
      // indicating the meal should be added to the favourite meals list
      state = state.where((m) => (m.id != meal.id)).toList();
      return false; // Indicating meal was removed to show snackbars accordingly
    } else {
      // ... (spread operator) used to pull out individual items from the list state and put them in the new state list
      state = [...state, meal];
      return true; // Indicating meal was added to show snackbars accordingly
    }
  }
}

// StateNotifierProvider used for dynamic data that does change
final favouriteMealsProvider =
    StateNotifierProvider<FavouritesMealsNotifier, List<Meal>>((ref) {
  return FavouritesMealsNotifier();
});
