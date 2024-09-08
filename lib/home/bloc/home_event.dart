part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialFetchEvent extends HomeEvent {}

class HomeProductWishlistButtonEvent extends HomeEvent{
  final ProductsDataModel product;
  HomeProductWishlistButtonEvent({required this.product});
}

class HomeProductCartButtonEvent extends HomeEvent{
  final ProductsDataModel product;
  HomeProductCartButtonEvent({required this.product});
}

class HomeAppBarWishListButtonEvent extends HomeEvent{}

class HomeAppBarCartButtonEvent extends HomeEvent{}