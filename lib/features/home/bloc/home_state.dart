part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState {}

final class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadedSuccessState({required this.products});
}

class HomeErrorState extends HomeState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}


final class cartAddedState extends HomeActionState {
  final List<ProductDataModel> cartProducts;

  cartAddedState({required this.cartProducts});
}
