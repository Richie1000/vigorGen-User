import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import './cart.dart';
import './lab_cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;
  final bool completed;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
    @required this.completed
  });
}

class LabOrderItem {
  final String id;
  final double amount;
  final List<LabCartItem> products;
  final DateTime dateTime;

  LabOrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  List<LabOrderItem> _laborders = [];
  final String authToken;
  final String userId;

  Orders(this.authToken, this.userId, this._orders);

  List<OrderItem> get orders {
    return [..._orders];
  }

  List<LabOrderItem> get labOrders {
    return [..._laborders];
  }

  Future<void> fetchAndSetOrders() async {
    final Uri url = Uri.parse('https://shop-app-d00fc-default-rtdb.firebaseio.com/orders/$userId.json?auth=$authToken');
    final response = await http.get(url);
    final List<OrderItem> loadedOrders = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((orderId, orderData) {
      loadedOrders.add(
        OrderItem(
          id: orderId,
          amount: orderData['amount'],
          dateTime: DateTime.parse(orderData['dateTime']),
          completed: orderData['completed'],
          products: (orderData['products'] as List<dynamic>)
              .map(
                (item) => CartItem(
                      id: item['id'],
                      price: item['price'],
                      quantity: item['quantity'],
                      title: item['title'],
                    ),
              )
              .toList(),
        ),
      );
    });
    _orders = loadedOrders.reversed.toList();
    notifyListeners();
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final Uri url = Uri.parse('https://shop-app-d00fc-default-rtdb.firebaseio.com/orders/$userId.json?auth=$authToken');
    final timestamp = DateTime.now();
    final response = await http.post(
      url,
      body: json.encode({
        'amount': total,
        'dateTime': timestamp.toIso8601String(),
        'products': cartProducts
            .map((cp) => {
                  'id': cp.id,
                  'title': cp.title,
                  'quantity': cp.quantity,
                  'price': cp.price,
                })
            .toList(),
        'completed': false
      }),
    );
    _orders.insert(
      0,
      OrderItem(
        id: json.decode(response.body)['name'],
        amount: total,
        dateTime: timestamp,
        products: cartProducts,
      ),
    );
    notifyListeners();
  }

  Future<void> addLabOrder(List<LabCartItem> cartProducts, double total) async {
    final Uri url = Uri.parse('https://shop-app-d00fc-default-rtdb.firebaseio.com/orders/$userId.json?auth=$authToken');
    final timestamp = DateTime.now();
    final response = await http.post(
      url,
      body: json.encode({
        'amount': total,
        'dateTime': timestamp.toIso8601String(),
        'products': cartProducts
            .map((cp) => {
                  'id': cp.id,
                  'title': cp.title,
                  'price': cp.price,
                })
            .toList(),
      }),
    );
    _laborders.insert(
      0,
      LabOrderItem(
        id: json.decode(response.body)['name'],
        amount: total,
        dateTime: timestamp,
        products: cartProducts,
      ),
    );
    notifyListeners();
  }

<<<<<<< Updated upstream
  Future <void> addOrderCompletion( String id)async{
    try {
   
    final Uri url = Uri.parse('https://shop-app-d00fc-default-rtdb.firebaseio.com/orders/$userId/$id.json?auth=$authToken');
    await http.patch(url, body: 
      json.encode(
       { 'completed': true}
=======
  Future <void> addOrderCopletion(bool isComplete, DateTime dateId)async{
    dateId.toIso8601String();
    try {
    final prodIndex = _orders.firstWhere((ord) => ord.dateTime.toIso8601String() == dateId);
    final Uri url = Uri.parse('https://shop-app-d00fc-default-rtdb.firebaseio.com/orders/$userId.json?auth=$authToken');
    await http.patch(url, body: 
      json.encode(
       { 'completed': isComplete}
>>>>>>> Stashed changes
      )
     );
  } catch (error) {
    print(error);
  }
  }
}
