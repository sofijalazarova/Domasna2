import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../models/recipe_model.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_navbar.dart';
import '../widgets/hero_carousel_card.dart';
import '../widgets/recipe_carousel.dart';
import '../widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );

  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network('https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80',
          fit: BoxFit.contain,
          width: double.infinity,
          height: double.infinity,
        ),      
        Scaffold(
        appBar: const CustomAppBar(title: 'Title'),
        bottomNavigationBar: const CustomNavBar(),
        body: SingleChildScrollView (
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/back.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Container(
                  child: CarouselSlider(
                    options: CarouselOptions(
                    aspectRatio: 1.5,
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    ),
                    items: Category.categories
                    .map((category) => HeroCarouselCard(category: category)).toList(),
                  )
                ),
                const SectionTitle(title: 'RECOMMENDED'),
                  
                RecipeCarousel(recipes: Recipe.recipes
                .where((recipe) => recipe.isRecommended).toList()),
                  
                const SectionTitle(title: 'MOST POPULAR'),
                  
                RecipeCarousel(recipes: Recipe.recipes
                .where((recipe) => recipe.isPopular).toList()),
                  
              ],
            ),
          ),
        ),
      ),
      ],
    );
  }
}
