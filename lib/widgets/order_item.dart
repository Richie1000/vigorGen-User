import 'dart:math';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;
  var _isDelivered = false;
  var _isLoading = false;

  String getCurrency() {
    var format =
        NumberFormat.currency(locale: Platform.localeName, name: 'GHS');
    print(format);
    return format.currencySymbol;
  }

  Future<void> _completeOrder() async {
    
    var _orderToComplete = Provider.of<ord.Orders>(context, listen: false);
    _isDelivered = true;
    try {
    await _orderToComplete.addOrderCompletion( widget.order.id);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: (Text("User Will be notified")),
      )
    );
    //_expanded = true;
    }catch(error){
      print(error);
    }
    Navigator.pop(context);
  }

  void _switchChanger(bool status) {
    setState(() {
      //isChecked = status;
    });
  }

  void _showModalSheet() {
    bool isChecked = false;
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(children: [
                Text("Has Item/Service been Delivered?"),
                Switch(
                  activeColor: Theme.of(context).primaryColor,
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value;
                      print(isChecked);
                    });
                  },
                )
              ]),
              TextButton(child: Text("OK"), onPressed: _completeOrder)
            ])));
  }

  @override
  Widget build(BuildContext context) {
    bool _isChecked = false;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height:
          _expanded ? min(widget.order.products.length * 20.0 + 110, 200) : 100,
      child: Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onLongPress: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Has Item/Service been Delivered?",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            TextButton(
                                child: Text("Yes", style: TextStyle(fontSize: 15),), 
                                onPressed: _completeOrder),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("No", style: TextStyle(fontSize: 15),))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              child: ListTile(
                title: Row(
                  children: [
                    Text(getCurrency() + ' ${widget.order.amount}'),
                    SizedBox(
                      width: 70
                    ),
                    if(widget.order.completed != null && widget.order.completed == true) Icon(Icons.check_circle,color: Colors.green),
                    if (widget.order.completed != null && widget.order.completed == false) 
                    Icon(Icons.warning, color: Colors.red)
                  ]
                ),
                subtitle: 
                    Text(
                      DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
                    ),
                trailing: IconButton(
                  icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                  onPressed: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                ),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: _expanded
                  ? min(widget.order.products.length * 20.0 + 10, 100)
                  : 0,
              child: ListView(
                children: widget.order.products
                    .map(
                      (prod) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            prod.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            prod.quantity != null
                                ? '${prod.quantity} x ' +
                                    getCurrency() +
                                    ' ${prod.price}'
                                : getCurrency() + ' ${prod.price}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                          
                        ],
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
