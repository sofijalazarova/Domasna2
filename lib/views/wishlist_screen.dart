import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/wishlist/wishlist_bloc.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_navbar.dart';
import '../widgets/recipe_card.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const WishlistScreen(),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Wish list'),
      bottomNavigationBar: const CustomNavBar(),

      
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {

          if (state is WishlistLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is WishlistLoaded) {

          return GridView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 16.0,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 2.4), 
          itemCount: state.wishlist.recipes.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: 
                RecipeCard(
                  recipe: state.wishlist.recipes[index],
                  widthFactor: 1.1,
                  leftPosition: 100,
                  isWishList: true,
              ),
            );
          },
        );
      }
        else {
          return const Text('Something went wrong');
        }       
      },     
      ),
    );
  }
}