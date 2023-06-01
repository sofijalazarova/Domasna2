import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../models/recipe_model.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/recipe_carousel.dart';

class UserPage extends StatefulWidget {
  static const String routeName = '/userScreen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => UserPage(),
    );
  }

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String currentLocation = '';

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  void getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        currentLocation =
            'Latitude: ${position.latitude}\nLongitude: ${position.longitude}';
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: const CustomAppBar(title: 'User profile'),
    body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/back.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.black,
                backgroundImage: AssetImage('assets/images/login.png'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Sofija Lazarova',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Current Location:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                currentLocation,
                style: const TextStyle(fontSize: 16),
              ),

              RecipeCarousel(
                    recipes: Recipe.recipes
                        .where((recipe) => recipe.isPopular)
                        .toList()),
            ],
          ),
        ),
      ),
    ),
  );
}

}