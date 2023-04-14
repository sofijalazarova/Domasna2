import 'package:flutter/material.dart';
import 'package:homework2/widgets/recipe_card.dart';

import '../models/recipe_model.dart';

class RecipeCarousel extends StatelessWidget {

  final List<Recipe> recipes;

  const RecipeCarousel({
    super.key,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: RecipeCard(recipe: recipes[index],),
          );
        } ),
    );
  }
}