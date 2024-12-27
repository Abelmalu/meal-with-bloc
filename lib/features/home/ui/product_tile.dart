import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/home_product_data.dart';

class ProductItem extends StatelessWidget {
  final ProductDataModel productItem;

  const ProductItem({super.key, required this.productItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      margin:EdgeInsets.symmetric(vertical:15),
      
      
      height: 300,
      child: Card(
        elevation: 7,
        child: Column(
          children: <Widget>[
            Image.network(productItem.imageUrl,fit:BoxFit.cover,height: 250, width: double.infinity),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
                IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),

            ],)
            
        
        
          ],
        ),
      ),
    );
  }
}
