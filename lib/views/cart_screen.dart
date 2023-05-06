import 'package:flutter/material.dart';
import 'package:homework2/models/recipe_model.dart';

import '../widgets/cart_recipe_card.dart';
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
            SizedBox(height: 10,),
            CartRecipeCard(recipe: Recipe.recipes[0],),
            CartRecipeCard(recipe: Recipe.recipes[1]),
            const Divider(
              thickness: 2
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Some text', style: Theme.of(context).textTheme.headlineSmall,)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Some text', style: Theme.of(context).textTheme.headlineSmall,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

