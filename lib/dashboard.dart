import 'package:dash_flutter/food.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.menu,
                color: Colors.black,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 6,
                          spreadRadius: 4,
                          offset: Offset(0.0, 3.0))
                    ],
                    color: Color(0xFFC6E7FE),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('lib/assets/images/tuxedo.png'),
                        fit: BoxFit.contain
                        )),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'SEARCH FOR',
            style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w800, fontSize: 27.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'RECIPES',
            style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w800, fontSize: 27.0),
          ),
        ),
        SizedBox(height: 25.0),
        Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: GoogleFonts.notoSans(
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    fillColor: Colors.grey.withOpacity(0.5),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    )),
              ),
            )),
        SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'Recommended',
            style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w500, fontSize: 18.0),
          ),
        ),
        SizedBox(height: 15.0),
        Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildListItem('Hamburger', 'lib/assets/images/burger.png',
                    '21', Color(0xFFFFE9C6), Color(0xFFDA9551)),
                _buildListItem('Chips', 'lib/assets/images/fries.png', '15',
                    Color(0xFFC2E3FE), Color(0xFF6A8CAA)),
                _buildListItem('Donuts', 'lib/assets/images/doughnut.png', '15',
                    Color(0xFFD7FADA), Color(0xFF56CC7E)),
              ],
            )),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: TabBar(
            controller: tabController,
            isScrollable: true,
            indicatorColor: Colors.transparent,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.withOpacity(.6),
            labelStyle:
                GoogleFonts.notoSans(fontSize: 16, fontWeight: FontWeight.w700),
            unselectedLabelStyle:
                GoogleFonts.notoSans(fontSize: 13, fontWeight: FontWeight.w500),
            tabs: [
              Tab(
                child: Text('Featured'),
              ),
              Tab(
                child: Text('Combo'),
              ),
              Tab(
                child: Text('Favorites'),
              ),
              Tab(
                child: Text('Recommended'),
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height - 450.0,
          child: TabBarView(
            children: [
              FoodTap(),
                   

            ],
            controller: tabController,
          ),
        )
      ]),
    );
  }

  _buildListItem(String foodName, String imgpath, String price, Color bgcolor,
      Color textColor) {
    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 175,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: bgcolor),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Hero(
                tag: foodName,
                child: Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Center(
                    child: Image.asset(
                      imgpath,
                      height: 50,
                      width: 50,
                    ),
                  ),
                )),
            SizedBox(
              height: 25,
            ),
            Text(
              foodName,
              style: GoogleFonts.notoSans(fontSize: 17, color: textColor),
            ),
            Text(
              '\$' + price,
              style: GoogleFonts.notoSans(fontSize: 17, color: textColor),
            )
          ]),
        ),
      ),
    );
  }
}
