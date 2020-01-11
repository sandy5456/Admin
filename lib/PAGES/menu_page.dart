import 'package:flutter/material.dart';
import 'package:kafe/FOODMENU/apitizers/apitizers_list.dart';
import 'package:kafe/FOODMENU/breakfast/breakfast_list.dart';
import 'package:kafe/FOODMENU/burger/burger_list.dart';
import 'package:kafe/FOODMENU/cold_drink_list.dart';
import 'package:kafe/FOODMENU/cold_drinks.dart';
import 'package:kafe/FOODMENU/dessert/dessert_list.dart';
import 'package:kafe/FOODMENU/drinks.dart';
import 'package:kafe/FOODMENU/hotdrinks.dart';
import 'package:kafe/FOODMENU/maincourse/main_course_list.dart';
import 'package:kafe/FOODMENU/pasta/pasta_list.dart';
import 'package:kafe/FOODMENU/salad/salad_list.dart';
import 'package:kafe/FOODMENU/sandwich/sandwich_list.dart';
import 'package:kafe/FOODMENU/soft%20drink/softdrink_list.dart';
import 'package:kafe/MODELS/food_response.dart';
import 'package:kafe/PAGES/add_item.dart';
import 'package:vertical_tabs/vertical_tabs.dart';

class MenuScreen extends StatefulWidget {
  List<Food> foods;
  int cId;
  String name;
  MenuScreen({this.foods, this.name, this.cId});
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  TabController _tabController;
  @override
  Widget build(BuildContext context) {
    return 
       Container(
         color: Colors.white,
         child: Stack(
           
          children: <Widget>[
             Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child:  VerticalTabs(
                    indicatorColor: Colors.white,
                    unselectedTabBackgroundColor: Color(0xffcdcdcd),
                    selectedTabBackgroundColor: Colors.white,
                    contentScrollAxis: Axis.vertical,
                    indicatorWidth: 2,
                    itemExtent: 30,
                    tabsWidth: 100,
                    tabs: <Tab>[
                      Tab(
                        child: box("HOT DRINKS"),
                      ),
                      Tab(child: box("COLD DRINKS")),
                      Tab(child: box("APPWTIZER")),
                      Tab(child: box("BREAKFAST")),
                      Tab(child: box("SALAD")),
                      Tab(
                        child: box("SANDWICH"),
                      ),
                      Tab(child: box("PASTA")),
                      Tab(child: box("MAIN COURSE")),
                      Tab(child: box("BURGER")),
                      Tab(child: box("DESSERT")),
                      Tab(child: box("SOFT DRINKS")),
                    ],
                    contents: <Widget>[
                    //    SoupsItemCard(
                    //   cId: widget.cId,
                    //   name: widget.name,
                    //   foods: widget.foods,
                    // ),
                      Soups(),
                      ColdDrink(),
                   ApitizersList(),
                   Brreakfast(),
                   SaladList(),
                   SandwichList(),
                    PastaList(),
                     MainCourseList(),
                      BurgerList(),
                    DessertList(),
                    SoftDrinkList(),
                    ],
                  ),
                
              ),
            
            Positioned(
              left: MediaQuery.of(context).size.width * 0.03,
              bottom: MediaQuery.of(context).size.height * 0.05,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.width * 0.2,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0)),
                  child: Text('ADD',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Abel')),
                  onPressed: () {
                    setState(() {
                       Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddItem()),
                                    );
                    });
                  },
                  color: Colors.black87,
                ),
              ),
            ),
          ],
      ),
       );
    
  }

  Widget box(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            child: Center(
          child: Text(text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Abel',
                  fontSize: 11)),
        )),
        Divider(
          color: Colors.transparent,
          height: 1,
        ),
        Container(
          // padding: EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
              //                    <--- top side
              color: Colors.white,
              width: 0.3,
            ),
          )),
        ),
      ],
    );
  }
}
