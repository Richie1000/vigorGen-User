import 'package:flutter/material.dart';

import './category_list_item.dart';

class CategoryList extends StatelessWidget {
  //const CategoryList({ Key? key }) : super(key: key);
  List imgList = [
    
    "assets/images/antibacterial.jpg",
    "assets/images/aphrodisiac.jpg",
    "assets/images/contraceptives.png",
    "assets/images/cosmetics.png",
    "assets/images/kids_drug.png",
    "assets/images/painkillers.png",
    "assets/images/pregnancy.png",
  ];
  List title =[
    "Anti-Bacterial",
    "Aphrodisiac",
    "Contraceptive",
    "Cosmetics",
    "Kids Drug",
    "PainKillers",
    "Pregnancy",
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
     height: MediaQuery.of(context).size.height/6,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryItem(imgList[0], title[0]),
          CategoryItem(imgList[1], title[1]),
          CategoryItem(imgList[2], title[2]),
          CategoryItem(imgList[3], title[3]),
          CategoryItem(imgList[4], title[4]),
          CategoryItem(imgList[5], title[5]),
          CategoryItem(imgList[6], title[6]),
        ],
      ),
    );
  }
}

