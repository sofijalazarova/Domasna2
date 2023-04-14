import 'package:flutter/material.dart';
import 'package:homework2/models/recipe_model.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/custom_navbar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CartScreen(),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Cart'),
      bottomNavigationBar: const CustomNavBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                ElevatedButton(onPressed: () {
                  Navigator.pushNamed(context, '/');
                }, child: const Text(
                  'Add More Items',
                ))
              ],
            ),
            CartRecipeCard(recipe: Recipe.recipes[0],),
          ],
        ),
      ),
    );
  }
}


class CartRecipeCard extends StatelessWidget {

  final Recipe recipe;

  const CartRecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(recipe.imageUrl,
        width: 100,
        height: 80,
        fit: BoxFit.cover,
      ),
      const SizedBox(
        width: 10,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(recipe.name, style: Theme.of(context).textTheme.headlineSmall,),
          Text(recipe.description)
        ],
      )
      ],
    );
  }
}