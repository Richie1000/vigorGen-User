import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {

  final String img;
  final String title;

  CategoryItem(this.img, this.title);
  //const CategoryItem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: 8,
      child: Column(
        children: [
          CircleAvatar(
              backgroundImage:AssetImage(img),
              maxRadius: MediaQuery.of(context).size.width/10,
              backgroundColor: Colors.transparent,
            ),
        Container(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12
            ),
          ),
        )
        ],
      ),
    );
  }
}