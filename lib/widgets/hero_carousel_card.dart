import 'package:flutter/material.dart';
import 'package:homework2/models/recipe_model.dart';

import '../models/category_model.dart';

class HeroCarouselCard extends StatelessWidget {

  final Category? category;
  final Recipe? recipe;

  const HeroCarouselCard({
    Key? key,
    this.category,
    this.recipe
    }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/catalog', arguments: category);
      },
      child: Container(
       margin: const EdgeInsets.symmetric(
        horizontal: 5.0,
        vertical: 20,
       ),
       child: ClipRRect(
           borderRadius: const BorderRadius.all(Radius.circular(5.0)),
           child: Stack(
             children: <Widget>[
               Image.network(
                recipe == null ? category!.imageUrl : recipe!.imageUrl, 
                fit: BoxFit.cover,
                width: 1000.0),
               Positioned(
                 bottom: 0.0,
                 left: 0.0,
                 right: 0.0,
                 child: Container(
                   decoration: const BoxDecoration(
                     gradient: LinearGradient(
                       colors: [
                         Color.fromARGB(200, 0, 0, 0),
                         Color.fromARGB(0, 0, 0, 0)
                       ],
                       begin: Alignment.bottomCenter,
                       end: Alignment.topCenter,
                     ),
                   ),
                   padding: const EdgeInsets.symmetric(
                       vertical: 10.0, horizontal: 20.0),
                   child: Text(
                     recipe == null ? category!.name : '',
                     style: const TextStyle(
                       color: Colors.white,
                       fontSize: 20.0,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
                ),
             ],
           )),
      ),
    );
}}