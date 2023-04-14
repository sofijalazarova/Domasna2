part of 'wishlist_bloc.dart';


abstract class WishlistEvent extends Equatable {

  const WishlistEvent();

  @override
  List<Object> get props => [];

}

class StartWishlist extends WishlistEvent {}

class AddWishlistRecipe extends WishlistEvent {
  final Recipe recipe;

  const AddWishlistRecipe(this.recipe);

  @override
  List<Object> get props => [recipe];
}

class RemoveWishlistRecipe extends WishlistEvent {
  final Recipe recipe;

  const RemoveWishlistRecipe(this.recipe);

  @override
  List<Object> get props => [recipe];

}
