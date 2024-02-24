import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test2_bloc_app/data/sample_data.dart';
import 'package:test2_bloc_app/pages/home/models/home_product_data.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {
    on<HomeInitialEvent>(
      homeInitialEvent
    );
    on<HomeProductWishlistButtonClickEvent>(
      homeProductWishlistButtonClickEvent
    );
    on<HomeWishlistButtonNavigateEvent>(
      homeWishlistButtonNavigateEvent
    );


    on<HomeProductCartButtonClickEvent>(
      homeProductCartButtonClickEvent
    );
    on<HomeCartButtonNavigateEvent>(
      homeCartButtonNavigateEvent
    );
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeBlocState> emit) async {
    emit(HomeBlocLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeBlocLoadedSuccessState(
      products: FoodData.indianFood.map((e) => 
      ProductDataModel(
        id: e['id'], 
        name: e['name'], 
        price: e['price'], 
        image: e['image'])
      ).toList()
    )
    );
  }

  FutureOr<void> homeProductWishlistButtonClickEvent(HomeProductWishlistButtonClickEvent event, Emitter<HomeBlocState> emit) {
    print('wishlist');
  }

  FutureOr<void> homeProductCartButtonClickEvent(HomeProductCartButtonClickEvent event, Emitter<HomeBlocState> emit) {
    print('cart list');
  }

  

  FutureOr<void> homeWishlistButtonNavigateEvent(HomeWishlistButtonNavigateEvent event, Emitter<HomeBlocState> emit) {
    print('wishlist Nav');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeBlocState> emit) {
    print('cart NaV');
    emit(HomeNavigateToCartPageActionState());
  }

  
}
