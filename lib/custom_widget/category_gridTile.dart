import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/category_model.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.category, required this.onSelectedCategory});
  final Category category;
  final void Function() onSelectedCategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectedCategory,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(71),
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            gradient: LinearGradient(colors: [
              category.color.withAlpha(255), // Full opacity
              category.color.withAlpha(150),
              // category.color.withAlpha(2),
              // category.color.withAlpha(1),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            Positioned(
                right: -30,
                top: -15,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(75),
                  child: Image.asset(
                    category.image,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                )),
            Positioned(
              bottom: -1,
              child: Text(
                category.title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface),
              ),
            )
          ],
        ),
      ),
    );
  }
}
