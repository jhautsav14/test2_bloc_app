import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2_bloc_app/pages/cart/ui/cart_page.dart';
import 'package:test2_bloc_app/pages/home/bloc/home_bloc_bloc.dart';
import 'package:test2_bloc_app/pages/home/ui/product_tile_widget.dart';
import 'package:test2_bloc_app/pages/wishlist/ui/wish_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    homeBlocBloc.add(HomeInitialEvent());
    super.initState();
  }
  final HomeBlocBloc homeBlocBloc = HomeBlocBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBlocBloc, HomeBlocState>(
      bloc: homeBlocBloc,
      buildWhen: (previous, current) => current is !HomeBlocActionState ,
      listenWhen: (previous, current) => current is HomeBlocActionState,

      listener: (context, state) {
        if(state is HomeNavigateToCartPageActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
        }
        else if(state is HomeNavigateToWishlistPageActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>WishListPage()));
        }
        else if (state is HomeProductItemCartActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item in Cart')));
        }
        else if (state is HomeProductItemWishlistedActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item in Wishlist')));
        }
      },
      builder: (context, state) {
        
        switch (state.runtimeType) {
          case HomeBlocLoadingState:
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
          case HomeBlocLoadedSuccessState:
              final successState = state as HomeBlocLoadedSuccessState;
              return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title:const Text(
                      'Food Data',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
        actions:  [
          IconButton(icon: Icon(Icons.favorite_border),
            onPressed:() {
              homeBlocBloc.add(HomeWishlistButtonNavigateEvent());
            },
          ),
          const SizedBox(width: 10,),
          IconButton(icon : Icon(Icons.shopping_bag_outlined),
            onPressed: (){
              homeBlocBloc.add(HomeCartButtonNavigateEvent());
            },
          )
    
        ],
    ),
      body: ListView.builder(
        itemCount: successState.products.length,
        itemBuilder: (context, index){
          return ProductTileWidget(
            homeBlocBloc: homeBlocBloc,
            productDataModel: successState.products[index]
          );
        } 
        )
    );
              

          case HomeBlocErrorState:
              return const Scaffold(
                body: Center(child: Text('Error')),
              );
              
              
          default:
            return SizedBox();
            
          
        }
        
      },
    );
  }
}



