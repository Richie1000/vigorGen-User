import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/lab_request_details_screen.dart';
import 'package:provider/provider.dart';

import '../providers/lab_cart.dart';
import '../widgets/cart_item.dart';
import '../providers/orders.dart';

class LabCartScreen extends StatelessWidget {
  static const routeName = '/labcart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<LabCart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Laboratory Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color:
                            Theme.of(context).primaryTextTheme.headline6.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  OrderButton(cart: cart)
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartItem(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].price,
                1,
                cart.items.values.toList()[i].title,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final LabCart cart;

  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: _isLoading ? CircularProgressIndicator() : Text('ORDER NOW'),
      onPressed: (widget.cart.totalAmount <= 0 || _isLoading)
          ? null
          : () async {
              // setState(() {
              //   _isLoading = true;
              // });
              // await Provider.of<Orders>(context, listen: false).addLabOrder(
              //   widget.cart.items.values.toList(),
              //   widget.cart.totalAmount,
              // );
              // setState(() {
              //   _isLoading = false;
              // });
              // widget.cart.clear();
              Navigator.pushReplacementNamed(context, LabRequestDetailsScreen.routeName);
            },
      //textColor: Theme.of(context).primaryColor,
    );
  }
}
