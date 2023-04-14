import 'package:flutter/material.dart';
import 'package:homework2/models/recipe_model.dart';

class RecipeCard extends StatelessWidget {

  final Recipe recipe;
  final double widthFactor;
  final double leftPosition;
  final bool isWishList;

  const RecipeCard({
    super.key,
    required this.recipe,
    this.widthFactor = 2.5,
    this.leftPosition = 5,
    this.isWishList = false,
  });

  @override
  Widget build(BuildContext context) {

    final double widthValue = MediaQuery.of(context).size.width / widthFactor;


    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context, 
          '/recipe', 
          arguments: recipe);
      },
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / widthFactor,
            height: 150,
            child: Image.network(
              recipe.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: leftPosition,
            child: Container(
              width: MediaQuery.of(context).size.width / 2.5 - leftPosition,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: leftPosition + 5,
            child: Container(
              width: MediaQuery.of(context).size.width / 2.5 - 10 - leftPosition,
              height: 70,
              decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              ),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recipe.name,
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.white, fontSize: 15
                              ),
                            ),
                            Text(
                              '${Recipe.recipes[0].time}min',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.white, fontSize: 14, backgroundColor: Colors.red
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: IconButton(icon: const Icon(Icons.add_circle, color: Colors.white,),
                      onPressed: () {},),
                    ),
                    isWishList ? Expanded(
                      child: IconButton(icon: const Icon(Icons.delete, color: Colors.white,),
                      onPressed: () {},),
                    ) : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}