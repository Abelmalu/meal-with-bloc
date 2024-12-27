import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../home/models/home_product_data.dart';
import '../../../data/cart_items.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<RemoveItemsFromCartEvent>(removeItemsFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartItemsLoadedState(cartProducts: cartItems));
  }

  FutureOr<void> removeItemsFromCartEvent(
      RemoveItemsFromCartEvent event, Emitter<CartState> emit) {
     cartItems.remove(event.clickedProduct);

     emit(CartItemsLoadedState(cartProducts: cartItems));
  }
}
