import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test2_bloc_app/data/cart_items.dart';
import 'package:test2_bloc_app/pages/home/models/home_product_data.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBlocBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBlocBloc() : super(CartBlocInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartBlocState> emit) {
    emit(CartBlocSuccessState(cartItem: cartItem));
  }

  FutureOr<void> cartRemoveFromCartEvent(CartRemoveFromCartEvent event, Emitter<CartBlocState> emit) {

    cartItem.remove(event.productDataModel);

    emit(CartBlocSuccessState(cartItem: cartItem));


  }
}
