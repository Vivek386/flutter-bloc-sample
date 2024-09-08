import 'package:blocpattern/cart/bloc/cart_bloc.dart';
import 'package:blocpattern/home/models/home_products_data.dart';
import 'package:flutter/material.dart';




class CartListTile extends StatelessWidget {
  final CartBloc cartBloc;
  final ProductsDataModel? product;
  const CartListTile({super.key, this.product, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: NetworkImage(product!.imageUrl.toString(),
                )
            )),
          ),
          Text(product!.name.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          Text(product!.description.toString()),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(product!.price.toString(),style: TextStyle(fontWeight: FontWeight.bold,),),
              Row(
                children: [
                  IconButton(onPressed: (){
                    // cartBloc.add(HomeProductWishlistButtonEvent(
                    //     product: product!
                    // ));
                  }, icon: const Icon(Icons.favorite)),
                  IconButton(onPressed: (){
                    cartBloc.add(CartDeleteItemEvent(cartProduct: product!));
                  }, icon: const Icon(Icons.shopping_cart))

                ],
              )


            ],)
        ],
      ),
    );
  }
}
