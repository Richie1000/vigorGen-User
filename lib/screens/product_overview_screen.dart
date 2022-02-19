import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_item.dart';
import '../widgets/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  //const ProductsOverviewScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final List<Product> loadedProduct =
    return Scaffold(
      appBar: AppBar(
        title: Text("My Shop"),
      ),
      body: ProductsGrid(),
    );
  }
}
