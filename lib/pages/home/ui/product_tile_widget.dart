
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test2_bloc_app/pages/home/models/home_product_data.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  const ProductTileWidget({super.key, required this.productDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange, width: 6),
        borderRadius: BorderRadius.circular(16),
        color: Colors.yellow[600]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              
              image: DecorationImage(image: NetworkImage(productDataModel.image),
              fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey[200]
            ),
          ),
         
          Text(productDataModel.name, style: TextStyle(color: Colors.orange.shade900, fontSize: 24, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Rs. ${productDataModel.price.toString()}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
              Row(
                
                
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline_sharp)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.shopping_bag_outlined))
                ],
              )
            ],
          ),

               
        ]
      ),


    );
  }
}