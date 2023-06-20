import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodTap extends StatefulWidget {
  const FoodTap({super.key});

  @override
  State<FoodTap> createState() => _FoodTapState();
}

class _FoodTapState extends State<FoodTap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildListItem(
              'Delicious hot dog', 4.0, '6', 'lib/assets/images/hotdog.png')
        ],
      ),
    );
  }

  _buildListItem(String foodName, rate, String price, String imgpath) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child :Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
             width: 210.0,
             child: Row(
              children: [
                Container(height: 75.0,width: 75.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: Color(0xFFFFE3DF),
                ),
                child: Center(
                  child: Image.asset(imgpath,height: 50.0,width: 50.0,),
                ),
                ),
                SizedBox(width: 20.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(foodName,style: GoogleFonts.notoSans(fontSize: 14.0,fontWeight: FontWeight.w400),),
                Row(
                  children: [
                    Text('\$'+price,style: GoogleFonts.lato(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFF68D7F),
                    ),),
                    SizedBox(width: 3.0,),
                    Text(
                            '\$' + '18',
                            style: GoogleFonts.lato(
                              fontSize: 12.0,
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.withOpacity(.9),
                            ),
                          ),
                          
                  ],
                )
                  ],
                ),
               
              ],
             ),
          ),
    FloatingActionButton(
              onPressed: () {},
              heroTag: foodName,
              mini: true,
              backgroundColor: Color(0xFFFE7D6A),
              child: Center(
                  child: Icon(
                Icons.add,
                color: Colors.white,
              )),
            )

      ],)
    );
  }
}
