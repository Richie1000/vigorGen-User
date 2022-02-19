import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import './product_item.dart';
import '../providers/product.dart';

class ProductsGrid extends StatelessWidget {
  /* const ProductsGrid({
    Key key,
    @required this.loadedProduct,
  }) : super(key: key);

  final List<Product> loadedProduct; */

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, i) => ProductItem(
            products[i].id, products[i].title, products[i].imageUrl));
  }
}
