import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2_bloc_app/pages/cart/bloc/cart_bloc_bloc.dart';
import 'package:test2_bloc_app/pages/cart/ui/cart_tile.dart';
import 'package:test2_bloc_app/pages/home/ui/product_tile_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBlocBloc cartBlocBloc = CartBlocBloc();

  @override
  void initState() {
    cartBlocBloc.add(CartInitialEvent());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: BlocConsumer<CartBlocBloc, CartBlocState>(
        bloc: cartBlocBloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        listenWhen: (previous, current) => current is CartBlocActionState,
        buildWhen: (previous, current) => current is !CartBlocActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartBlocSuccessState:
              final successState = state as CartBlocSuccessState;
              return ListView.builder(
                      itemCount: successState.cartItem.length,
                      itemBuilder: (context, index){
                        return CartTile(
                          cartBlocBloc: cartBlocBloc,
                          productDataModel: successState.cartItem[index]
                        );
                      } 
                      );
          }
          return Container();
        },
      ),
    );
  }
}
