import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocpattern/data/cart_items.dart';
import 'package:meta/meta.dart';

import '../../home/models/home_products_data.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartDeleteItemEvent>(cartDeleteItemEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartDeleteItemEvent(CartDeleteItemEvent event, Emitter<CartState> emit) {
  cartItems.remove(event.cartProduct);

  emit(CartSuccessState(cartItems: cartItems));
  }
}
