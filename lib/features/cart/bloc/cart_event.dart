part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class RemoveItemsFromCartEvent extends CartEvent {
  final ProductDataModel clickedProduct;

  RemoveItemsFromCartEvent({required this.clickedProduct});
}
