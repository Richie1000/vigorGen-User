
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

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
      body: AnimationLimiter(
        child: ListView.builder(
          padding: EdgeInsets.all(_width / 30),
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: 5,
          itemBuilder: (BuildContext c, int i) {
            return AnimationConfiguration.staggeredList(
              position: i,
              delay: Duration(milliseconds: 100),
              child: SlideAnimation(
                duration: Duration(milliseconds: 2500),
                curve: Curves.fastLinearToSlowEaseIn,
                horizontalOffset: 30,
                verticalOffset: 300.0,
                child: FlipAnimation(
                  duration: Duration(milliseconds: 3000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  flipAxis: FlipAxis.y,
                  child: LabItem()
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

