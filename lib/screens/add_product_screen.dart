import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class AddProduct extends StatefulWidget {
  //const AddPlace({ Key? key }) : super(key: key);
  static const routeName = "./addPlace";

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add product "),

      ),
      body: SingleChildScrollView(
        child:Form(
          child: Column(children: [
            InputBox("Name", true),
            SizedBox(
              height: 10
            ),
            InputBox("Price", false),
            SizedBox(
              height: 10
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Product Description"
              ),
              keyboardType: TextInputType.multiline,
            ),
            SizedBox(
              height:10
            ),
            InputBox("Add Pictures", true),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor)
              ),
              onPressed: (){}, 
              child: Icon(Icons.add_box_outlined))
          ]),
        )
      ),
    );
  }
}

class InputBox extends StatelessWidget {

  final String placeHolder;
  final bool inputIsString;

  InputBox(@required this.placeHolder, @required this.inputIsString);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: placeHolder,
      ),
      keyboardType: !inputIsString ? TextInputType.number : null,
    );


  }
}