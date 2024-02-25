part of 'home_bloc_bloc.dart';

@immutable
abstract class HomeBlocEvent {}


class HomeInitialEvent extends HomeBlocEvent{}

class HomeProductWishlistButtonClickEvent extends HomeBlocEvent{
  final ProductDataModel clickedProduct;

  HomeProductWishlistButtonClickEvent({
    required this.clickedProduct
    });
    


}

class HomeProductCartButtonClickEvent extends HomeBlocEvent{
  final ProductDataModel clickedProduct;

  HomeProductCartButtonClickEvent({
    required this.clickedProduct
    });
  
}

class HomeWishlistButtonNavigateEvent extends HomeBlocEvent{
  
}

class HomeCartButtonNavigateEvent extends HomeBlocEvent{
  
}