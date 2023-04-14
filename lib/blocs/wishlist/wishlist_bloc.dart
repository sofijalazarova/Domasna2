import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework2/models/recipe_model.dart';

import '../../models/wishlist_model.dart';
part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {

  WishlistBloc() : super(WishlistLoading()) {
  on<StartWishlist>((event, emit) async* {
    yield* _mapStartWishlistToState();
  });
}


  Stream<WishlistState> mapEventToState(
    WishlistEvent event,
  ) async* {

    if (event is StartWishlist) {
      yield* _mapStartWishlistToState();
    } else  if (event is AddWishlistRecipe) {
      yield* _mapAddWishlistRecipeToState(event, state);
    } else  if (event is RemoveWishlistRecipe) {
      yield* _mapRemoveWishlistRecipeToState(event, state);
    }
}


    Stream<WishlistState> _mapStartWishlistToState(
    ) async* {

      yield WishlistLoading();
      try {
        await Future<void>.delayed(Duration(seconds: 1));
        yield const WishlistLoaded();
      } catch (_) {}
    }

    Stream<WishlistState> _mapAddWishlistRecipeToState(
      AddWishlistRecipe event,
      WishlistState state,
    ) async* {

      if (state is WishlistLoaded) {
        try {
          yield WishlistLoaded(wishlist: Wishlist(recipes: List.from(state.wishlist.recipes)..add(event.recipe),),);
        } catch (_) {

        }
      }
    }

    Stream<WishlistState> _mapRemoveWishlistRecipeToState(
      RemoveWishlistRecipe event,
      WishlistState state,
    ) async* {

      if (state is WishlistLoaded) {
        try {
          yield WishlistLoaded(wishlist: Wishlist(recipes: List.from(state.wishlist.recipes)..remove(event.recipe),),);
        } catch (_) {

        }
      }
    }

}