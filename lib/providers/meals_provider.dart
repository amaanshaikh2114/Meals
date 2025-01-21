import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';

// Provider used for static data that doesn't change
final mealsProvider = Provider((ref) {
  return dummyMeals;
});
