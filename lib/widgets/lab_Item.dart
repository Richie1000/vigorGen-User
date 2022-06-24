import 'package:flutter/material.dart';

class LabItem extends StatefulWidget {
  @override
  _LabItemState createState() => _LabItemState();
}

class _LabItemState extends State<LabItem> {
  String TapToExpandIt = 'Tap to Expand it';
  String Sentence = 'Widgets that have global keys reparent their subtrees when'
      ' they are moved from one location in the tree to another location in the'
      ' tree. In order to reparent its subtree, a widget must arrive at its new'
      ' location in the tree in the same animation frame in which it was removed'
      ' from its old location the tree.'   ;
  bool isExpanded = true;
  bool isExpanded2 = true;

  @override
  Widget build(BuildContext context) {
    return Column (children:[ InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: AnimatedContainer(
              margin: EdgeInsets.symmetric(
                horizontal: isExpanded ? 25 : 0,
                vertical: 10,
              ),
              padding: EdgeInsets.all(10),
              height: isExpanded ? 70 : 330,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 1200),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff6F12E8).withOpacity(0.5),
                    blurRadius: 20,
                    offset: Offset(5, 10),
                  ),
                ],
                color: Color(0xff6F12E8),
                borderRadius: BorderRadius.all(
                  Radius.circular( 20),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                                              child: Text(
                          TapToExpandIt,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        color: Colors.white,
                        size: 27,
                      ),
                    ],
                  ),
                  isExpanded ? SizedBox() : SizedBox(height: 20),
                  AnimatedCrossFade(
                    firstChild: Text(
                      '',
                      style: TextStyle(
                        fontSize: 0,
                      ),
                    ),
                    secondChild: Column(
                      children: [
                        Text(
                          Sentence,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.7,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(Icons.shopping_cart),
                              onPressed: (){
                                print("Item tapped");
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    crossFadeState: isExpanded
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: Duration(milliseconds: 1200),
                    reverseDuration: Duration.zero,
                    sizeCurve: Curves.fastLinearToSlowEaseIn,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                isExpanded2 = !isExpanded2;
              });
            },
            child: AnimatedContainer(
              margin: EdgeInsets.symmetric(
                horizontal: isExpanded2 ? 25 : 0,
                vertical: 20,
              ),
              padding: EdgeInsets.all(20),
              height: isExpanded2 ? 70 : 330,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 1200),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffFF5050).withOpacity(0.5),
                    blurRadius: 20,
                    offset: Offset(5, 10),
                  ),
                ],
                color: Color(0xffFF5050),
                borderRadius: BorderRadius.all(
                  Radius.circular(isExpanded2 ? 20 : 0),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        TapToExpandIt,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(
                        isExpanded2
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        color: Colors.white,
                        size: 27,
                      ),
                    ],
                  ),
                  isExpanded2 ? SizedBox() : SizedBox(height: 20),
                  AnimatedCrossFade(
                    firstChild: Text(
                      '',
                      style: TextStyle(
                        fontSize: 0,
                      ),
                    ),
                    secondChild: Column(
                      children: [
                        Text(
                          Sentence,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.7,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.shopping_cart),
                          onPressed: (){
                            print("Item tapped");
                          },
                        )
                      ],
                    ),
                    crossFadeState: isExpanded2
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: Duration(milliseconds: 1200),
                    reverseDuration: Duration.zero,
                    sizeCurve: Curves.fastLinearToSlowEaseIn,
                  ),
                ],
              ),
            ),
          ),
          ]);
    
  }}