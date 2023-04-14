import 'package:flutter/material.dart';
import 'package:homework2/blocs/wishlist/wishlist_bloc.dart';
import 'package:homework2/models/recipe_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/hero_carousel_card.dart';

class RecipeScreen extends StatelessWidget {

  static const String routeName = '/recipe';

  static Route route({required Recipe recipe}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => RecipeScreen(recipe: recipe),
    );

  }

  final Recipe recipe;

  const RecipeScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: recipe.name),
      bottomNavigationBar: 
      BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            IconButton(
              icon: const Icon(Icons.share, color: Colors.white),
              onPressed: () {},),
            BlocBuilder<WishlistBloc, WishlistState>(
              builder: (context, state) {
                return IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.white),
                  onPressed: () {
                    context
                    .read<WishlistBloc>()
                    .add(AddWishlistRecipe(recipe));

                    final snackBar = SnackBar(content: Text('Added to your list'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },);
              }
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {}, 
              child: Text('ADD TO CART',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white,
              ),))
          ],),
        ),)
      ,
      body: ListView(
        children: [
          CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1.5,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
          ),
          items: [
            HeroCarouselCard(
              recipe: recipe,
            )
          ],),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.bottomCenter,
                  color: const Color(0xFFE1D0BF),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width - 10,
                  height: 50,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text(recipe.name, 
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),
                      ),
                      Text('${recipe.time}min', style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white, backgroundColor: Colors.red)),
                    ]),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
            initiallyExpanded: true,
            title: Text('Recipe Ingredients', style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontStyle: FontStyle.italic, fontSize: 20,
            )),
            children: recipe.ingredients.map((ingredient) {
            return ListTile(
              title: Text(
              ingredient,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            );
        }).toList(),
        ),
        ),

        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            'Recipe Description',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontStyle: FontStyle.italic, fontSize: 20),
          ),

        ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    recipe.description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15),
                  ),
                ),
              ),

        
        ],
      ),
    );
  }
}