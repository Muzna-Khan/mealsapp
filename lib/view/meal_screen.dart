import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealsapp/custom_widget/meal_item.dart';
import 'package:mealsapp/view/meal_detail.dart';

import '../models/meal_model.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, required this.meals, required this.title});
  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Nothing here",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
        const SizedBox(
          height: 16,
        ),
        Text("Try selecting different Category",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSurface))
      ],
    ));

    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) {
            return MealItem(
                meal: meals[index],
                onSelectMeal: (meal) {
                  //Navigate to meal screen
                  Get.to(() => MealDetail(meal: meal));
                });
          });
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
