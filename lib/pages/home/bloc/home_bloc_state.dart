part of 'home_bloc_bloc.dart';

@immutable
abstract class HomeBlocState {}

abstract class HomeBlocActionState extends HomeBlocState{}

class HomeBlocInitial extends HomeBlocState {}

class HomeBlocLoadingState extends HomeBlocState{}

class HomeBlocLoadedSuccessState extends HomeBlocState{
  final List<ProductDataModel> products;
  
  HomeBlocLoadedSuccessState({
    required this.products
  });


}

class HomeBlocErrorState extends HomeBlocState{}

class HomeNavigateToWishlistPageActionState extends HomeBlocActionState{}

class HomeNavigateToCartPageActionState extends HomeBlocActionState{}
