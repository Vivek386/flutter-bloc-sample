import 'package:blocpattern/cart/pages/cart.dart';
import 'package:blocpattern/home/pages/product_listtile_widget.dart';
import 'package:blocpattern/wishlist/pages/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialFetchEvent());
    super.initState();
  }
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (context, state){
        if(state is AppBarCartActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context) =>const Cart()));
        }

        else if(state is AppBarWishListActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context) =>const WishList()));
        }

        else if(state is HomeProductWishlistedState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item Wishlisted")));
        }

        else if(state is HomeProductCartedState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item added to cart")));
        }
      },
       listenWhen: (context,state) => state is HomeActionState,
       buildWhen: (context,state) => state is !HomeActionState,
      builder: (context, state) {
        switch(state.runtimeType){
          case HomeLoadingState:
            return Scaffold(
              body: Center(child: CircularProgressIndicator(),),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return SafeArea(
              child: Scaffold(

                appBar: AppBar(
                  backgroundColor: Colors.teal,
                  title: Text("Viveks Grocery App"),
                  actions: [
                    IconButton(onPressed: (){
                      homeBloc.add(HomeAppBarWishListButtonEvent());
                    }, icon: const Icon(Icons.favorite)),
                    IconButton(onPressed: (){
                      homeBloc.add(HomeAppBarCartButtonEvent());
                    }, icon: const Icon(Icons.shopping_cart))
                  ],
                ),
                body: ListView.builder(
                    itemCount: successState.products!.length,
                    itemBuilder: (context,index){
                  return ProductListTile(
                    product: successState.products![index],
                    homeBloc: homeBloc,
                  );}),
              ),
            );
          case HomeErrorState:
            return Scaffold(
              body: Center(child: Text("Error"),),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}
