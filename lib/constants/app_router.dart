import 'package:flutter/material.dart';
import 'package:homework2/models/recipe_model.dart';

import '../models/category_model.dart';
import '../views/cart_screen.dart';
import '../views/catalog.dart';
import '../views/home.dart';
import '../views/recipe_view.dart';
import '../views/wishlist_screen.dart';

class AppRouter {

  static Route onGenerateRoute(RouteSettings settings){
      print('This is route: ${settings.name}');

      switch (settings.name) {
        case '/':
          return HomeScreen.route();
        case HomeScreen.routeName:
          return HomeScreen.route();
        case CartScreen.routeName:
          return CartScreen.route();
        case RecipeScreen.routeName:
          return RecipeScreen.route(recipe: settings.arguments as Recipe);
        case WishlistScreen.routeName:
          return WishlistScreen.route();
        case CatalogScreen.routeName:
          return CatalogScreen.route(category: settings.arguments as Category);        
        default:
          return _errorRoute();
      }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
      )
    );
  }


}