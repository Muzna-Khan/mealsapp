import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mealsapp/controllers/home_screen_controller.dart';
import '../custom_widget/meal_item.dart';
import 'meal_detail.dart';

class FavouriteMealsScreen extends StatelessWidget {
  const FavouriteMealsScreen({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeScreenController>();
    Widget content = Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Uh! No Nothing here",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
        const SizedBox(
          height: 16,
        ),
        Text("Mark some meal as Favourite",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSurface))
      ],
    ));

    if (homeController.favMeals.isNotEmpty) {
      content = Obx(
        () => ListView.builder(
            itemCount: homeController.favMeals.length,
            itemBuilder: (context, index) {
              return MealItem(
                  meal: homeController.favMeals[index],
                  onSelectMeal: (meal) {
                    //Navigate to meal screen
                    Get.to(() => MealDetail(meal: meal));
                  });
            }),
      );
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
