import 'package:flutter/material.dart';

class LabItem with ChangeNotifier{
  final double resultItem1;
  final double resultItem2;
  final double resultItem3;
  final double resultItem4;
  final double resultItem5;
  final double resultItem6;
  final double resultItem7;
  final double resultItem8;
  final double resultItem9;
  final double resultItem10;
  final double resultItem11;
  
  LabItem({
    @required this.resultItem1,
    @required this.resultItem2,
    @required this.resultItem3,
    @required this.resultItem4,
    @required this.resultItem5,
    @required this.resultItem6,
    @required this.resultItem7,
    @required this.resultItem8,
    @required this.resultItem9,
    @required this.resultItem10,
    @required this.resultItem11,
  });
}

class LabTest with ChangeNotifier{
  final String id;
  final String title;
  final String price;
  final String description;

  LabTest({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.description
  });
}