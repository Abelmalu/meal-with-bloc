import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../home/models/home_product_data.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<CartEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
