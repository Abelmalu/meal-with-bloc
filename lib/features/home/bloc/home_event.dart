part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class HomeInitialEvent extends HomeEvent {}

final class HomeCartButtonEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeCartButtonEvent({required this.clickedProduct});

}

final class HomeCartButtonNavigateEvent extends HomeEvent {}
