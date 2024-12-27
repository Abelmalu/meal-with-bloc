import 'package:bloc_meal/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/ui/product_tile.dart';
import '../bloc/cart_bloc.dart';
import 'cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    BlocProvider.of<CartBloc>(context).add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your  Carts'),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartItemsLoadedState) {
            final cartSuccessState = state as CartItemsLoadedState;
            if (!cartSuccessState.cartProducts.isEmpty) {
              return ListView.builder(
                itemCount: cartSuccessState.cartProducts.length,
                itemBuilder: (context, index) {
                  return CartItem(
                      cartItem: cartSuccessState.cartProducts[index]);
                },
              );
            } else {
              return Center(child: Text('no items in the cart'));
            }
          }
          else{
             return Center(child: Text('something is wrong,try again'));

          }
        },
        listener: (context, state) {},
      ),
    );
  }
}
