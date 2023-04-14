import 'package:equatable/equatable.dart';

class Recipe extends Equatable {

  final String name;
  final String category;
  final String imageUrl;
  final int time;
  final bool isPopular;
  final bool isRecommended;
  final List<String> ingredients;
  final String description;

  const Recipe({
    required this.name, 
    required this.category, 
    required this.imageUrl, 
    required this.time, 
    required this.isPopular,
    required this.isRecommended,
    required this.ingredients,
    required this.description});
    
      @override
      List<Object?> get props => [
        name,
        category,
        imageUrl,
        time,
        isPopular,
        isRecommended,
        ingredients,
        description,
      ];


    static List<Recipe> recipes = [
      const Recipe(
        name: 'Avocado and egg toast', 
        category: 'Grilled Chicken', 
        imageUrl: 'https://i0.wp.com/www.pepperdelight.com/wp-content/uploads/2017/05/pepper-delight-avocado-egg-toast-1.jpg?resize=852%2C1104', 
        time: 45, 
        isPopular: false, 
        isRecommended: true,
        ingredients: ['Boneless skinless chicken breasts or chicken thighs', 'Olive oil', 'Apple cider vinegar or red wine vinegar', 'Honey', 'Garlic powder'],
        description: 'I can only call it like I see it: This marinade is EASY to make! First, stir together the wet ingredients (olive oil, vinegar, lemon juice, honey, dijon mustard) with the dry spices (Italian seasoning, garlic powder, salt, onion powder, and pepper).'
      ),
      const Recipe(
        name: 'Quinoa Salad', 
        category: 'category', 
        imageUrl: 'https://www.whiskaffair.com/wp-content/uploads/2021/02/Mediterranean-Chickpea-Quinoa-Salad-2-3.jpg', 
        time: 30, 
        isPopular: true, 
        isRecommended: false,
        ingredients: ['Boneless skinless chicken breasts or chicken thighs', 'Olive oil', 'Apple cider vinegar or red wine vinegar', 'Honey', 'Garlic powder'],
        description: 'I can only call it like I see it: This marinade is EASY to make! First, stir together the wet ingredients (olive oil, vinegar, lemon juice, honey, dijon mustard) with the dry spices (Italian seasoning, garlic powder, salt, onion powder, and pepper).'
      ),
      const Recipe(
        name: 'Grilled Chicken Pasta', 
        category: 'category', 
        imageUrl: 'https://static.onecms.io/wp-content/uploads/sites/19/2012/08/01/grilled-chicken-florentine-pasta-ck.jpg', 
        time: 60, 
        isPopular: false, 
        isRecommended: true,
        ingredients: ['Boneless skinless chicken breasts or chicken thighs', 'Olive oil', 'Apple cider vinegar or red wine vinegar', 'Honey', 'Garlic powder'],
        description: 'I can only call it like I see it: This marinade is EASY to make! First, stir together the wet ingredients (olive oil, vinegar, lemon juice, honey, dijon mustard) with the dry spices (Italian seasoning, garlic powder, salt, onion powder, and pepper).'
      ),
      const Recipe(
        name: 'Pizza', 
        category: 'category', 
        imageUrl: 'https://tmbidigitalassetsazure.blob.core.windows.net/rms3-prod/attachments/37/1200x1200/Pizza-from-Scratch_EXPS_FT20_8621_F_0505_1_home.jpg', 
        time: 28, 
        isPopular: true, 
        isRecommended: false,
        ingredients: ['Boneless skinless chicken breasts or chicken thighs', 'Olive oil', 'Apple cider vinegar or red wine vinegar', 'Honey', 'Garlic powder'],
        description: 'I can only call it like I see it: This marinade is EASY to make! First, stir together the wet ingredients (olive oil, vinegar, lemon juice, honey, dijon mustard) with the dry spices (Italian seasoning, garlic powder, salt, onion powder, and pepper).'
      ),

    ];

}