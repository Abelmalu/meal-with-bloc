import 'package:bloc_meal/features/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../home/models/home_product_data.dart';

class CartItem extends StatelessWidget {
  final ProductDataModel cartItem;

  const CartItem({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 15),
      height: 300,
      child: Card(
        elevation: 7,
        child: Column(
          children: <Widget>[
            Image.network(cartItem.imageUrl,
                fit: BoxFit.cover, height: 250, width: double.infinity),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
                IconButton(
                  onPressed: () {
                    context.read<CartBloc>().add(
                        RemoveItemsFromCartEvent(clickedProduct: cartItem));
                  },
                  icon: Icon(Icons.shopping_cart),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
