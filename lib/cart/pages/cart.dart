import 'package:flutter/material.dart';

import '../../home/pages/product_listtile_widget.dart';
import '../bloc/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_listtile_widget.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Cart"),),
        body: BlocConsumer<CartBloc, CartState>(
          bloc: cartBloc,
            listenWhen: (context, state) => state is CartActionState,
            buildWhen: (context, state) => state is! CartActionState,
            listener: (context, state) {

            },
            builder: (context, state) {
              switch (state.runtimeType) {
                case CartSuccessState:
                  final successState = state as CartSuccessState;
                  return ListView.builder(
                      itemCount: successState.cartItems!.length,
                      itemBuilder: (context, index) {
                        return CartListTile(
                          product: successState.cartItems![index],
                          cartBloc: cartBloc,
                        );
                      });
                default:
              }
              return Container();
            })
    );
  }
}