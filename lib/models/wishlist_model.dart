import 'package:equatable/equatable.dart';
import 'package:homework2/models/recipe_model.dart';

class Wishlist extends Equatable {
  final List<Recipe> recipes;

  const Wishlist({this.recipes = const <Recipe>[]});
  
  @override
  List<Object?> get props => throw UnimplementedError();


}