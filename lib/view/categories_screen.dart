import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealsapp/controllers/home_screen_controller.dart';
import 'package:mealsapp/custom_widget/category_gridTile.dart';
import '../models/meal_model.dart';
import 'meal_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});
  final RxList<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  final homeController = Get.find<HomeScreenController>();
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedBuilder(
        animation: _animationController,
        child: GridView(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            for (var category in homeController.availableCategories)
              CategoryGridItem(
                category: category,
                onSelectedCategory: () {
                  final filterMeals = homeController.availableMeals
                      .where((meal) => meal.categories.contains(category.id))
                      .toList();
                  // Nav to meal screen
                  Get.to(() => MealScreen(
                        meals: filterMeals,
                        title: '',
                      ));
                },
              )
          ],
        ),
        builder: (context, child) => SlideTransition(
          position: Tween(begin: Offset(0, 0.3), end: Offset(0, 0)).animate(
            CurvedAnimation(
                parent: _animationController, curve: Curves.easeInOut),
          ),
          child: child,
        ),
      );
    });
  }
}
