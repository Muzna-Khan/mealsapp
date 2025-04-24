import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealsapp/controllers/home_screen_controller.dart';

import '../models/meal_model.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeScreenController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded =
                    homeController.toggleMealFavouriteStatus(meal).value;
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: const Duration(milliseconds: 800),
                    backgroundColor: wasAdded ? Colors.green : Colors.red,
                    behavior: SnackBarBehavior.floating,
                    content: Text(
                        wasAdded ? "Meals added as Favourite" : "Meal Removed",
                        style: const TextStyle(color: Colors.white))));
              },
              icon: Obx(() => Icon(homeController.favMeals.contains(meal)
                  ? Icons.star
                  : Icons.star_border)))
        ],
      ),
      body: Column(
        children: [
          Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              )),
          const SizedBox(
            height: 16,
          ),
          Text("Ingredients",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold)),
          for (final ingredient in meal.ingredients)
            Text(ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold)),
          Text("Steps",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold)),
          for (final step in meal.steps)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.8),
              child: Text(step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.bold)),
            ),
        ],
      ),
    );
  }
}
