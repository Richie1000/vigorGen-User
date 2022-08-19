import 'package:flutter/material.dart';

import './products_grid.dart';
import './categories_list.dart';

class GridwithCategoryList extends StatelessWidget {
  const GridwithCategoryList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CategoryList(),
                Expanded(child: ProductsGrid(false))
              ]),
        ),
      ),
    );
  }
}
