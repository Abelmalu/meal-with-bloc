import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_meal/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_meal/features/home/models/home_product_data.dart';
import 'package:meta/meta.dart';
import '../../../data/cart_items.dart';

import '../../../data/grocery_data.dart';

// Assuming the necessary imports for the events and states

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeCartButtonEvent>(homeCartButtonEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts.map((e) {
      return ProductDataModel(
          id: e['id'],
          name: e['name'],
          description: e['description'],
          price: e['price'],
          imageUrl: e['imageUrl']);
    }).toList()));
  }

  Future<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) async {
    emit(HomeNavigateToCartPageActionState());
    print('cart clicked');
  }

  FutureOr<void> homeCartButtonEvent(
      HomeCartButtonEvent event, Emitter<HomeState> emit) {
    print('cart button event working');
    final cartItem = event.clickedProduct;
    cartItems.add(cartItem);

    emit(cartAddedState(cartProducts: cartItems));
  }
}
