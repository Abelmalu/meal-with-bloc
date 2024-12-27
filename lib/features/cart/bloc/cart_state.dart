part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitialState extends CartState {

  


}

final class CattActionState extends CartState {}

final class CartItemsLoadedState extends CartState {
  final List<ProductDataModel> cartProducts;

  CartItemsLoadedState({required this.cartProducts});
}
