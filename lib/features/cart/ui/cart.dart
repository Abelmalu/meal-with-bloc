import 'package:bloc_meal/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';

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
          if (state is CartInitialState) {
            return Center(
              child: Text('Could not find products..Add Some'),
            );
          } 
          else {
            return Text('data');
          }
        },
        listener: (context, state) {},
      ),
    );
  }
}
