part of 'cart_bloc_bloc.dart';

@immutable
abstract class CartBlocState {}

abstract class CartBlocActionState extends CartBlocState {}

class CartBlocInitial extends CartBlocState {}

class CartBlocSuccessState extends CartBlocState{
  final List<ProductDataModel> cartItem;

  CartBlocSuccessState({required this.cartItem});
}
