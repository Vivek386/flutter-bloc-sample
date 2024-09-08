part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}


class HomeLoadingState extends HomeState{}

class HomeLoadedSuccessState extends HomeState{
  final List<ProductsDataModel>? products;
  HomeLoadedSuccessState({this.products});
}

class HomeErrorState extends HomeState {}

class AppBarWishListActionState extends HomeActionState{}

class AppBarCartActionState extends HomeActionState{}

class HomeProductWishlistedState extends HomeActionState{}

class HomeProductCartedState extends HomeActionState{}