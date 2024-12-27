import 'package:bloc_meal/features/home/ui/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/ui/cart.dart';
import '../bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<HomeBloc>(context).add(HomeInitialEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CartPage()));
        } 

        if( state is cartAddedState){

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('product added to cart'),
          ));


        }
        
        
        else {
          Text('hellow');
        }
        // TODO: implement listener
      },
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
                appBar: AppBar(title: Text('Grocery app'), actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
                  IconButton(
                      onPressed: () {
                        context
                            .read<HomeBloc>()
                            .add(HomeCartButtonNavigateEvent());
                      },
                      icon: Icon(Icons.shopping_cart)),
                ]),
                body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProductItem(
                        productItem: successState.products[index]);
                  },
                ));
          case HomeLoadingState:
            return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        return Scaffold(
          appBar: AppBar(title: Text('Grocery app'), actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
            IconButton(
                onPressed: () {
                  context.read<HomeBloc>().add(HomeCartButtonNavigateEvent());
                },
                icon: Icon(Icons.shopping_bag)),
          ]),
        );
      },
    );
  }
}
