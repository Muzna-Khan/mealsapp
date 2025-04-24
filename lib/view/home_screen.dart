import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealsapp/controllers/home_screen_controller.dart';
import 'package:mealsapp/view/categories_screen.dart';
import 'package:mealsapp/view/favourite_meals.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var activePageTitle = "Categories";
      Widget activeScreen =
          CategoriesScreen(availableMeals: homeScreenController.availableMeals);
      if (homeScreenController.selectedPageIndex.value == 1) {
        activeScreen = const FavouriteMealsScreen();
        activePageTitle = "Your Favourites";
      }

      return Scaffold(
          appBar: AppBar(
            title: Text(activePageTitle),
            //backgroundColor: Colors.blue.shade800,
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: homeScreenController.selectPage,
            currentIndex: homeScreenController.selectedPageIndex.value,
            items: const [
              BottomNavigationBarItem(
                  label: "Categories", icon: Icon(Icons.set_meal)),
              BottomNavigationBarItem(
                  label: "Favourites", icon: Icon(Icons.star))
            ],
          ),
          body: activeScreen);
    });
  }
}
