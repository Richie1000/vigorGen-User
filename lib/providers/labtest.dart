import 'package:flutter/material.dart';

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