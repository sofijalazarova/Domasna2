import 'package:flutter/material.dart';
import 'package:homework2/views/home.dart';

import '../models/recipe_model.dart';
import '../widgets/custom_appbar.dart';

class AddRecipeView extends StatefulWidget {
  static const String routeName = '/addRecipe';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => AddRecipeView(),
    );
  }

  @override
  _AddRecipeViewState createState() => _AddRecipeViewState();
}

class _AddRecipeViewState extends State<AddRecipeView> {
  String recipeName = '';
  int time = 0;
  String imageUrl = 'https://i0.wp.com/www.pepperdelight.com/wp-content/uploads/2017/05/pepper-delight-avocado-egg-toast-1.jpg?resize=852%2C1104';
  List<String> ingredients = [];
  String description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Upload Your Recipe'),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Name of your recipe',
                ),
                onChanged: (value) {
                  setState(() {
                    recipeName = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Time',
                ),
                onChanged: (value) {
                  setState(() {
                    time = int.parse(value);
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Ingredients (comma-separated)',
                ),
                onChanged: (value) {
                  setState(() {
                    ingredients = value.split(',');
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextField(
              decoration: InputDecoration(
                labelText: 'Image URL',
              ),
              onChanged: (value) {
                setState(() {
                  imageUrl = value;
                });
              },
),

              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
  onPressed: () {
    Recipe newRecipe = Recipe(
      name: recipeName,
      category: 'category', 
      imageUrl: imageUrl, 
      time: time,
      isPopular: true, 
      isRecommended: false, 
      ingredients: ingredients,
      description: description,
    );
    Recipe.recipes.add(newRecipe);
    Navigator.of(context).pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false,);

  },
  child: Text('Add Recipe'),
),

            ],
          ),
        ),
      ),
    );
  }
}

