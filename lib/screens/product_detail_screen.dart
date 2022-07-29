import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/image_caroussel.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../providers/products.dart';
import '../providers/cart.dart';

List imgList = [];


class ProductDetailScreen extends StatefulWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-detail';

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String getCurrency() {
  var format = NumberFormat.currency(locale: Platform.localeName, name: 'GHS');
  //print(format.currencySymbol);
  return format.currencySymbol;
}

@override
  void initState() {
    // TODO: implement initState
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;

    final productId = arguments['productId'] as String;
    var imgList = arguments['images'];
    Provider.of<Products>(context).images(productId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;

    final productId = arguments['productId'] as String;
    var imgList = arguments['images'];
    print(imgList);
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    imgList= Provider.of<Products>(context).images(productId) as List;

    return Scaffold(
      /*  appBar: AppBar(
        title: Text(loadedProduct.title),
      ), */
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(loadedProduct.title),
              background: Hero(
                tag: loadedProduct.id,
                child: Container(
      child: Column(
        children: [CarouselSlider(
              items: imgList
                  .map((item) => Container(
                        child: Center(
                          child: Image.network(
                            item,
                            fit: BoxFit.cover,
                            width: 1000,
                          ),
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ImageCaroussel(imgList: imgList),
        ])
      )
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 10),
                Text(
                  getCurrency() + ' ${loadedProduct.price}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Text(
                    loadedProduct.description,
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
                SizedBox(
                  height: 800,
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorLight,
        child: Icon(Icons.shopping_cart),
        onPressed: () => Provider.of<Cart>(context, listen: false).addItem(
            loadedProduct.id, loadedProduct.price, loadedProduct.title),
      ),
    );
  }
}

// class ImageCaroussel extends StatelessWidget {

//   List<String> imageList = [];
//   String imgSource1 = "";
//   //List<Widget>imageSliders;

//   ImageCaroussel({
//     @required imageList,
//     @required imgSouce1,
//   });
  
//   void _returnList(){
//     imageList = [imgSource1];
    
//   }

//   //var newImgList = _returnList();
  
  
//   List<Widget>imageSliders = imgList
//     .map((item) => Container(
//           child: Container(
//             margin: EdgeInsets.all(5.0),
//             child: ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                 child: Stack(
//                   children: <Widget>[
//                     Image.network(item, fit: BoxFit.cover, width: 1000.0),
//                     Positioned(
//                       bottom: 0.0,
//                       left: 0.0,
//                       right: 0.0,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [
//                               Color.fromARGB(200, 0, 0, 0),
//                               Color.fromARGB(0, 0, 0, 0)
//                             ],
//                             begin: Alignment.bottomCenter,
//                             end: Alignment.topCenter,
//                           ),
//                         ),
//                         padding: EdgeInsets.symmetric(
//                             vertical: 10.0, horizontal: 20.0),
//                         child: Text(
//                           'No. ${imgList.indexOf(item)} image',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 )),
//           ),
//         ))
//     .toList();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: CarouselSlider(
//         options: CarouselOptions(
//           aspectRatio: 1.5,
//           enlargeCenterPage: true,
//           enableInfiniteScroll: false,
//           enlargeStrategy: CenterPageEnlargeStrategy.height,
//           initialPage: 2,
//           autoPlay: false,
//         ),
//         items: imageSliders,
//       ),);
//   }
// }
