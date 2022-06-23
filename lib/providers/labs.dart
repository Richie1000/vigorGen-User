import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_guide/providers/product.dart';
import './labtest.dart';

class Lab with ChangeNotifier {
  List <LabTest> _items =[];

  List <LabTest> get items {
    return [..._items];
  }

  
}

