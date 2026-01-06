import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

// 1. Use Notifier instead of StateNotifier
class FavoriteMealsNotifier extends Notifier<List<Meal>> {
  
  // 2. Initial state is now set in a build() method
  @override
  List<Meal> build() {
    return [];
  }

  bool toggleMealFavoriteStatus(Meal meal) {
    // In Notifiers, 'state' is automatically available
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

// 3. Use NotifierProvider instead of StateNotifierProvider
final favoriteMealsProvider =
    NotifierProvider<FavoriteMealsNotifier, List<Meal>>(() {
  return FavoriteMealsNotifier();
});