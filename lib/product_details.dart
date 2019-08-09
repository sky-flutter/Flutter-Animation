import 'dart:async';

import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  String image;
  Color colors;

  ProductDetails(image, Color color) {
    this.image = image;
    colors = color;
  }

  @override
  _ProductDetailsState createState() => _ProductDetailsState(image, colors);
}

class _ProductDetailsState extends State<ProductDetails> {
  var myColor = Colors.blue;
  var myHeight = 10.0;
  var myWidth = 200.0;
  String image;
  Color colors;

  _ProductDetailsState(this.image, this.colors);

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 400), callback);
  }

  @override
  Widget build(BuildContext context) {
    myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: AnimatedContainer(
                curve: FlippedCurve(Curves.linear),
                margin: EdgeInsets.only(top: 300),
                alignment: Alignment.topCenter,
                duration: Duration(milliseconds: 800),
                width: myWidth,
                height: myHeight,
                color: colors,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Hero(
                child: Container(
                  margin: EdgeInsets.only(top: 24),
                  width: double.infinity,
                  height: 300,
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(image),
                  ),
                ),
                tag: image,
              ),
            ),
            createProductDetailsBottomView()
          ],
        ),
      ),
    );
  }

  createProductDetailsBottomView() {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(),
          flex: 60,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                    topLeft: Radius.circular(24))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(left: 24, right: 8, top: 24),
                    child: Text(
                      "Lavender",
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 24, right: 8, top: 24),
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade200),
                        child: IconButton(
                            icon: Icon(Icons.remove), onPressed: () {}),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 24, right: 24),
                        child: Text(
                          "1",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade200),
                        child:
                            IconButton(icon: Icon(Icons.add), onPressed: () {}),
                      ),
                      Expanded(
                        flex: 100,
                        child: Container(
                          margin: EdgeInsets.only(right: 24),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                  "\$",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12,fontWeight: FontWeight.w500)),
                              SizedBox(width: 4,),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                     "19",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 36)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          flex: 40,
        ),
      ],
    );
  }

  void callback() {
    setState(() {
      myHeight = MediaQuery.of(context).size.height;
      myWidth = MediaQuery.of(context).size.width;
    });
  }
}
