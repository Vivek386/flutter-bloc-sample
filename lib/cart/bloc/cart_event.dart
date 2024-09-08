part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}



class CartInitialEvent extends CartEvent{

}

class CartDeleteItemEvent extends CartEvent{
  final ProductsDataModel cartProduct;
  CartDeleteItemEvent({required this.cartProduct});
}

