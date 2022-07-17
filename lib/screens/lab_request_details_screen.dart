import 'package:flutter/material.dart';

import './lab_cart_screen.dart';

class LabRequestDetailsScreen extends StatefulWidget {
  static const routeName = "/LabRequestDetails";
  @override
  State<LabRequestDetailsScreen> createState() =>
      _LabRequestDetailsScreenState();
}

class _LabRequestDetailsScreenState extends State<LabRequestDetailsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _dropdownItems1 = ["At Home", "On Premise"];
  final _dropdownItems2 = ["Male", "Female"];
  String _dropdownvalue1 ;
  String _dropdownValue2 ;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    DropdownMenuItem<String> buildMenuItems(String item) =>
        DropdownMenuItem(value: item, child: Text(item, style: TextStyle()));
    return Scaffold(
        appBar: AppBar(
          title: Text("Vigor Gen"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Almost Done but Provide more details first", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: size.width / 1.5,
                    //height: size.height/6.5,
                    child: TextFormField(
                      validator: ((value) {
                        if (value.isEmpty){
                          return "Please enter your name";
                        }
                      }),
                      decoration: InputDecoration(
                        
                        label: Text("Name"),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: size.width / 1.5,
                    //height: size.height/6.5,
                    child: TextFormField(
                      validator: ((value) {
                        if (value.isEmpty || int.parse(value) > 99 || int.parse(value) < 0){
                          return "Enter a valid Age";
                        }
                      }),
                      decoration: InputDecoration(
                        label: Text("Age"),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: size.width / 1.5,
                    //height: size.height/6.5,
                    child: TextFormField(
                      validator: ((value) {
                        if (value.isEmpty || value.length < 11 || !value.startsWith("o")){
                          return "Enter valid Number";
                        }
                      }),
                      decoration: InputDecoration(
                        label: Text("Phone Number"),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  
                    // padding: EdgeInsets.all(10),
                    // width: size.width / 1.5,
                    // //height: size.height/6.5,
                    Row (
                      children: [
                        Text("Place of Sample Taking"),
                
                      DropdownButton(
                        isExpanded: true,
                        value: _dropdownvalue1,
                        items: _dropdownItems1.map(buildMenuItems).toList(),
                        onChanged: (value) {
                          setState(() {
                            _dropdownValue2 = value;
                          });
                        }),
                      ]
                    ),
                
                  Container(
                    padding: EdgeInsets.all(10),
                    width: size.width / 1.5,
                    //height: size.height/6.5,
                    child: Row( 
                      children: [
                        Text("Sex", style: TextStyle(
                          fontSize: 20
                        ),),
                        DropdownButton(
                      isExpanded: true,
                      value: _dropdownValue2,
                      items: _dropdownItems2.map(buildMenuItems).toList(),
                      onChanged: (value) {
                        setState(() {
                          _dropdownValue2 = value;
                        },);
                      },
                    ),],)
                  ),
                  ElevatedButton(
                      //padding: EdgeInsets.all(10),
                      onPressed: () {
                        Navigator.of(context).pushNamed(LabCartScreen.routeName);
                      },
                      child: Text("Proceed To Cart"))
                ]),
          ),
        ),);
  }
}
