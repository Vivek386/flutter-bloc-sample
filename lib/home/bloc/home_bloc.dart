import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocpattern/data/cart_items.dart';
import 'package:blocpattern/data/grocery_data.dart';
import 'package:blocpattern/data/wishlist_items.dart';
import 'package:blocpattern/home/models/home_products_data.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialFetchEvent>(homeInitialFetchEvent);
    on<HomeAppBarWishListButtonEvent>(homeAppBarWishListButtonEvent);
    on<HomeAppBarCartButtonEvent>(homeAppBarCartButtonEvent);
    on<HomeProductCartButtonEvent>(homeProductCartButtonEvent);
    on<HomeProductWishlistButtonEvent>(homeProductWishlistButtonEvent);
  }

  FutureOr<void> homeInitialFetchEvent(HomeEvent event, Emitter<HomeState> emit)async {
  emit(HomeLoadingState());
  await Future.delayed(Duration(seconds: 3));
  emit(HomeLoadedSuccessState(products: GroceryData.groceryProducts.map((data) =>
      ProductsDataModel(
    id: data["id"],
    name: data["name"],
    description: data["description"],
    price: data["price"],
      imageUrl: data["imageUrl"]
  )).toList()));
  }

  FutureOr<void> homeAppBarWishListButtonEvent(
      HomeAppBarWishListButtonEvent event, Emitter<HomeState> emit) async {
    print("appbar wishlist clicked");
    emit(AppBarWishListActionState());
  }


  FutureOr<void> homeAppBarCartButtonEvent(HomeAppBarCartButtonEvent event,
      Emitter emit) async {
    print("appbar Cart clicked");
    emit(AppBarCartActionState());
  }

  FutureOr<void> homeProductWishlistButtonEvent(HomeProductWishlistButtonEvent event,
      Emitter emit) async {
    print("Home Wishlist Product clicked");
    wishListItems.add(event.product);
    emit(HomeProductWishlistedState());

  }

  FutureOr<void> homeProductCartButtonEvent(HomeProductCartButtonEvent event,
      Emitter emit) async {
    print("Home Cart Product clicked");
    cartItems.add(event.product);
    emit(HomeProductCartedState());
  }



}