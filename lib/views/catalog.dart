import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../models/recipe_model.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_navbar.dart';
import '../widgets/recipe_card.dart';

class CatalogScreen extends StatelessWidget {

  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => CatalogScreen(category: category),
    );
  }

  final Category category;

  const CatalogScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {

    final List<Recipe> categoryRecipes = Recipe.recipes
    .where((recipe) => recipe.category == category.name).toList();

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
                image: AssetImage('assets/images/back.png'),
                fit: BoxFit.cover,
              ),
      ),
      child: Scaffold(
        appBar: CustomAppBar(title: category.name),
        bottomNavigationBar: const CustomNavBar(),
        body: GridView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 16.0,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.15), 
          itemCount: categoryRecipes.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: RecipeCard(recipe: categoryRecipes[index],
              widthFactor: 2.2,
              ),
            );
          }),
    
      ),
    );
  }
}
