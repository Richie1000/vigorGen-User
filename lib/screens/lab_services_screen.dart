
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../widgets/lab_Item.dart';
import '../widgets/app_drawer.dart';


class LabScreen extends StatelessWidget {
  static const routeName = "./LabScreen";
  @override
  Widget build(BuildContext context) {
    
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          title: Text("Vigor Gen"),
          centerTitle: true, 
          systemOverlayStyle: SystemUiOverlayStyle.light),
      drawer: AppDrawer(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('labtest').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> labtestSnapshot){
          if(labtestSnapshot.connectionState == ConnectionState.waiting){
            return SpinKitDualRing(color: Theme.of(context).primaryColor);
          }
          final lab = labtestSnapshot.data.docs;

          return ListView.builder(
            itemCount: lab.length,
            itemBuilder: (context, index) => LabItem(
              id: (lab[index].data() as Map<String, dynamic>)['id'],
              title: (lab[index].data() as Map<String, dynamic>)['Name'], 
              description: (lab[index].data() as Map<String, dynamic>)['Description'], 
              price: (lab[index].data() as Map<String, dynamic>)['Price']));
        },
      )
    );
  }
}

