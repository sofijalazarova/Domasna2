import 'package:flutter/material.dart';

import '../models/recipe_model.dart';

class CartRecipeCard extends StatelessWidget {

  final Recipe recipe;

  const CartRecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(recipe.imageUrl,
          width: 100,
          height: 80,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(recipe.name, style: Theme.of(context).textTheme.headlineSmall,),
              Text(recipe.description, style: Theme.of(context).textTheme.headlineSmall,)
            ],
          ),
        ),
        SizedBox(width: 10,),
        Row(
          children: [
            IconButton(onPressed: () {
    
            }, icon: Icon(Icons.remove_circle)),
            Text('1',
            style: Theme.of(context).textTheme.headlineSmall,),
            IconButton(onPressed: () {
    
            }, icon: Icon(Icons.add_circle))
          ],
        )
        ],
      ),
    );
  }
}