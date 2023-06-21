import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Burger extends StatefulWidget {
  final imgPath, foodName, pricePerItem, heroTag;

  const Burger(
      {super.key,
      required this.imgPath,
      required this.foodName,
      required this.pricePerItem,
      required this.heroTag});

  @override
  State<Burger> createState() => _BurgerState();
}

class _BurgerState extends State<Burger> {
    var netPrice = 0.0;
  var quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.menu,
                color: Colors.black,
              ),
              Stack(children: [
                FloatingActionButton(
                  mini: true,
                  onPressed: () {},
                  child:
                      Icon(Icons.shopping_cart_outlined,  color: Colors.white),
                  backgroundColor: Color(0xFFFE7D6A),
                ),
                Positioned(
                    top: 1.0,
                    right: 4.0,
                    child: Container(
                        height: 12.0,
                        width: 12.0,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Center(
                          child: Text('1',
                              style: GoogleFonts.notoSans(
                                  fontSize: 7.0,
                                  textStyle: TextStyle(color: Colors.red))),
                        )))
              ])
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'SUBER',
            style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w800, fontSize: 27.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            widget.foodName.toString().toUpperCase(),
            style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w800, fontSize: 27.0),
          ),
        ),
        SizedBox(height: 40.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Hero(
                tag: widget.heroTag,
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.imgPath),
                          fit: BoxFit.cover
                          )),
                )),
                Column(
                  children: [
                    Stack(children: [
                      Container(height: 45.0,width: 45.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFFE7D6A).withOpacity(.1),
                              spreadRadius: 6.0,
                              blurRadius: 6.0,
                              offset: Offset(5.0, 11.0)
                            )
                          ]
                      ),
                      ),
                      Container(
                        width: 50.0,
                        height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white
                          ),
                          child: Center(child: Icon(Icons.favorite_border, size:25.0,color: Color(0xFFFE7D6A)),),
                      )
                    ],),
                                    SizedBox(height: 35.0),

                    Stack(
                  children: [
                    Container(
                      height: 45.0,
                      width: 45.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFFFE7D6A).withOpacity(.1),
                                spreadRadius: 6.0,
                                blurRadius: 6.0,
                                offset: Offset(5.0, 11.0))
                          ]),
                    ),
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white),
                      child: Center(
                        child: Icon(Icons.restore,
                            size: 25.0, color: Color(0xFFFE7D6A)),
                      ),
                    )
                  ],
                )
                  ],
                ),
                

          ],
        ),
         SizedBox(height: 10.0),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              height: 70.0,
              width: 125.0,
              color: Colors.white,
              child: Center(
                  child: Text(
                '\$' + (int.parse(widget.pricePerItem) * quantity).toString(),
                style: GoogleFonts.notoSans(
                    fontSize: 40.0,
                    color: Color(0xFF5E6166),
                    fontWeight: FontWeight.w500),
              ))),
          Container(
              height: 60.0,
              width: 225.0,
              decoration: BoxDecoration(
                  color: Color(0xFFFE7D6A),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      height: 40.0,
                      width: 105.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                              iconSize: 17.0,
                              icon:
                                  Icon(Icons.remove, color: Color(0xFFFE7D6A)),
                              onPressed: () {
                                adjustQuantity('MINUS');
                              }),
                          Text(
                            quantity.toString(),
                            style: GoogleFonts.notoSans(
                                fontSize: 14.0,
                                color: Color(0xFFFE7D6A),
                                fontWeight: FontWeight.w400),
                          ),
                          IconButton(
                              iconSize: 17.0,
                              icon: Icon(Icons.add, color: Color(0xFFFE7D6A)),
                              onPressed: () {
                                adjustQuantity('PLUS');
                              }),
                        ],
                      )),
                  Text(
                    'Add to cart',
                    style: GoogleFonts.notoSans(
                        fontSize: 15.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ))
        ]),
      ]),
    );
  }
  
  adjustQuantity(pressed) {
    switch (pressed) {
      case 'PLUS':
        setState(() {
          quantity += 1;
        });
        return;
      case 'MINUS':
        setState(() {
          if (quantity != 0) {
            quantity -= 1;
          }
        });
        return;
    }
  }
}
